resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.public_subnet_cidr} - ${var.availability_zone}"
  }
}