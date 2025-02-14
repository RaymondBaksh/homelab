resource "aws_instance" "firstVM_2204" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    name = "AWS-EC2-SERVERNAME"
  }
}