resource "aws_key_pair" "publickey" {
  count = var.isProd
  key_name = "hoangdl-publickey"
  public_key = file("${path.module}/prod-publickey")
}
resource "aws_key_pair" "publickey" {
  count = var.isTesting
  key_name = "hoangdl-publickey"
  public_key = file("${path.module}/testing-publickey")
}