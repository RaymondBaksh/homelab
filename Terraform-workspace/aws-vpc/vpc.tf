provider "aws" {
    region = var.aws_region
}

resource "aws_vpc" "custom_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"

    tags = {
      "Name" = "custom_vpc"
    }
}