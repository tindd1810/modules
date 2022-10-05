resource "aws_instance" "jenkins-node" {
  count = 2
  ami                    = "ami-04ff9e9b51c1f62ca"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.terraform_remote_state.networking.outputs.sg-id]
  key_name               = aws_key_pair.publickey.key_name
  user_data              = file("${path.module}/userdata.sh")

  tags = {
    Name = "tindd-jenkins-agent"
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

# data "aws_subnet_ids" "example" {
#   vpc_id = data.terraform_remote_state.networking.outputs.vpc-id
# }

# data "aws_subnet" "tindd-subnet" {
#   for_each = data.aws_subnet_ids.example.ids
#   id       = each.value
# }

output "vpc-id" {
  value = data.terraform_remote_state.networking.outputs.vpc-id
}
output "agent-ip" {
  value = aws_instance.jenkins-node.public_ip
}