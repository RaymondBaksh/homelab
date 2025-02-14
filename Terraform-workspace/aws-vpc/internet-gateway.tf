resource "aws_internet_gateway" "custom_internet_gateway" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    "Name" = "custom_internet_gateway"
  }
}