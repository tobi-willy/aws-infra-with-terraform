resource "aws_autoscaling_group" "web_asg" {
  name = "web-asg"
  max_size = 2
  min_size = 1
  desired_capacity = 1
  vpc_zone_identifier = var.public_subnets
  target_group_arns = [var.target_group_arn]
  health_check_type = "ELB"
  health_check_grace_period = 30

  launch_template {
    id = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key = "Name"
    value = "web-asg-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

}



