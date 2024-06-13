resource "aws_elb" "web" {
  name               = "web-elb"
  availability_zones = ["us-west-2a"]
  security_groups    = [aws_security_group.web.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }
}