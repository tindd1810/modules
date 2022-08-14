resource "aws_instance" "tindd-amz-ec2" {
  count                  = var.ec2-instance
  ami                    = "ami-04ff9e9b51c1f62ca"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.terraform_remote_state.networking.outputs.sg-id]
  key_name               = aws_key_pair.prod-publickey.key_name
  user_data              = file("${path.module}/userdata.sh")

  tags = {
    Name = "tindd-amz-ec2"
  }
}

data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = var.bucket

    key    = "vpc/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

data "aws_subnet_ids" "example" {
  vpc_id = data.terraform_remote_state.networking.outputs.vpc-id
}

data "aws_subnet" "tindd-subnet" {
  for_each = data.aws_subnet_ids.example.ids
  id       = each.value
}

output "vpc-id" {
  value = data.terraform_remote_state.networking.outputs.vpc-id
}
output "ec2-ip0" {
  value = aws_instance.tindd-amz-ec2[0].public_ip
}
output "ec2-ip1" {
  value = aws_instance.tindd-amz-ec2[1].public_ip
}
output "load-balancer" {
  value = aws_lb.tindd-alb.dns_name
}