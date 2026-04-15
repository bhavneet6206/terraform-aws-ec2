provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "ssh_sg" {
  name = "terraform-ssh-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["var.my_ip"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
  ami                    = "ami-048f4445314bcaa09"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  key_name               = "var.key_name"
  user_data              = <<-EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd 
systemctl enable httpd
cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>Bhavneet Singh - Cloud Project</title>
</head>
<body>
    <h1>🚀 Deployed via Terraform</h1>
    <p>This web server is hosted on AWS EC2.</p>
    <p>Provisioned using Terraform with secure SSH and HTTP access.</p>
    <p>Configured Apache and deployed automatically.</p>

    <h2>About Me</h2>
    <p>Bhavneet Singh - AWS Security Engineer</p>

    <h2>Skills Used</h2>
    <ul>
        <li>AWS EC2</li>
        <li>Terraform</li>
        <li>Linux</li>
        <li>Networking & Security Groups</li>
    </ul>
</body>
</html>
HTML
EOF
  tags = {
    Name = "terraform-test"
  }
}
output "instance_public_ip" {
  value = aws_instance.myec2.public_ip
}
