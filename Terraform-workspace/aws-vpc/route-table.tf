resource "aws_route_table" "custom_route_table_internet" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_internet_gateway.id
  }

  tags = {
    "Name" = "custom_route_table_internet"
  }
}