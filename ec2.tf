resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public

  subnet_id  =  each.value.id
  route_table_id = aws_route_table.public_rt.id
}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = values(aws_subnet.public)[0].id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "web-server"
  }
}

data "template_file" "nginx_script" {
  template = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install nginx -y
    sudo systemctl start nginx
  EOF
}

resource "aws_launch_template" "web_template" {
  name_prefix   = "web-template-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = base64encode(data.template_file.nginx_script.rendered)

  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "web-instance"
    }
  }
}


resource "aws_instance" "app" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private["subnet_a"].id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name = var.key_name

  user_data = <<-EOF
              #!/bash/bin
              sudo apt update
              sudo apt install python3-pip -y
              pip3 install flask
              echo '
              from flask import Flask
              app = Flask(__name__)
              @app.route("/")
              def hello():
                  return "Hello from App Tier"
              if __name__ == "__main__":
                  app.run(host="0.0.0.0", port=5000)
              ' > app.py
              python3 app.py &
              EOF
              
  tags = {
    Name = "app-tier-instance"
  }
}

resource "aws_db_instance" "app-db" {
  identifier = "app-db"
  engine = "mysql"
  instance_class = "db.t3.micro"
  username = "admin"
  password = var.db_password
  allocated_storage = 20
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot = true
  publicly_accessible = false
}



