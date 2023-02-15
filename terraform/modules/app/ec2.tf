resource "aws_instance" "public" {
    ami = "ami-0dfcb1ef8550277af"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    key_name = "danielslosky"

    subnet_id = var.public_subnet.id
    security_groups = [
        aws_security_group.main.id
    ]
}

resource "aws_security_group" "main" {
  name = "test-sg"
  description = "Allow HTTP and SSH traffic via Terraform"
  vpc_id = var.public_subnet.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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