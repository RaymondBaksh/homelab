data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"]
filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
filter {
    name = "root-device-type"
    values = ["ebs"]
  }    
filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2-control-node" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.custom_security_group.id]
    key_name = "aws-vpc-cluster"
    
    tags = {
         "Name" = "ec2-control-node"
    }
}
resource "aws_instance" "ec2-worker1-node" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.custom_security_group.id]
    key_name = "aws-vpc-cluster"
    
    tags = {
         "Name" = "ec2-worker1-node"
    }
}
resource "aws_instance" "ec2-worker2-node" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.custom_security_group.id]
    key_name = "aws-vpc-cluster"
    
    tags = {
         "Name" = "ec2-worker2-node"
    }
}
