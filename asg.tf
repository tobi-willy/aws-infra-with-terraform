resource "aws_autoscaling_group" "web_asg" {
  name = "web-asg"
  max_size = 2
  min_size = 1
  desired_capacity = 1
  vpc_zone_identifier = [aws_subnet.public["subnet_a"].id,aws_subnet.public["subnet_b"].id]
  target_group_arns = [aws_lb_target_group.web_tg.arn]
  health_check_type = "ELB"
  health_check_grace_period = 30

  launch_template {
    id = aws_launch_template.web_template.id
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



