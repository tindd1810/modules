resource "aws_key_pair" "publickey" {
  key_name = "tindd-publickey-1"
  public_key = file("${path.module}/publickey")
}