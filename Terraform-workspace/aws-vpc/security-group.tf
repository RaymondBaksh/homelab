resource "aws_security_group" "custom_security_group" {
  vpc_id = aws_vpc.custom_vpc.id

  # WARNING: This egress rule allows all outbound traffic
  # Consider restricting to specific destinations for production use
  egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
  }

  # WARNING: SSH access from anywhere (0.0.0.0/0) is a security risk
  # TODO: Replace with your specific IP address or trusted CIDR block
  # Example: cidr_blocks = ["YOUR_IP/32"]
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  # WARNING: HTTP access from anywhere (0.0.0.0/0)
  # Consider using a load balancer or restricting access
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  # WARNING: Kubernetes API server exposed to the internet
  # CRITICAL: This should be restricted to trusted IP ranges only
  # Example: cidr_blocks = ["YOUR_IP/32"]
  ingress {
      from_port = 6443
      to_port = 6443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  # WARNING: etcd client API exposed to the internet
  # CRITICAL: This should be restricted to internal VPC only
  # Example: cidr_blocks = [aws_vpc.custom_vpc.cidr_block]
  ingress {
      from_port = 2379
      to_port = 2379
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "custom_security_group"
    "Description" = "Security group for Kubernetes cluster - REQUIRES HARDENING FOR PRODUCTION"
    "Environment" = "Development"
    "ManagedBy" = "Terraform"
  }
}