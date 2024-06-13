
provider "aws" {
  region = "us-west-2" 
}

resource "aws_launch_configuration" "web_lc" {
  name_prefix   = "web-lc-"
  image_id      = "ami-0cf2b4e024cdb6960" 
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web.id]
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 5
  min_size             = 1
  launch_configuration = aws_launch_configuration.web_lc.id
  vpc_zone_identifier  = [aws_subnet.subnet.id]
}

