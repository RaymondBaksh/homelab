resource "aws_security_group" "custom_security_group" {
  vpc_id = aws_vpc.custom_vpc.id

  egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 6443
      to_port = 6443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 2379
      to_port = 2379
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "custom_security_group"
    "Description" = "custom_security_group"
  }
}