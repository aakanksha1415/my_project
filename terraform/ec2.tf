resource "aws_instance" "app" {
  ami           = "ami-0cf2b4e024cdb6960 " 
  instance_type = "t2.micro"
  key_name      = "my-key" 

  subnet_id = aws_subnet.subnet1.id

  vpc_security_group_ids = [aws_security_group.allow_web.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2 mysql-server docker.io
              systemctl start apache2
              systemctl enable apache2
              systemctl start mysql
              systemctl enable mysql
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "MediaStreamingApp"
  }
}
