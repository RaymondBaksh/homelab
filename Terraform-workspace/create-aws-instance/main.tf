resource "aws_instance" "firstVM_2204" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    tags = {
         Name = var.instance_name
    }
}