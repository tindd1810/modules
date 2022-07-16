resource "aws_key_pair" "publickey1" {
  count = var.isProd
  key_name = "hoangdl-publickey"
  public_key = file("${path.module}/prod-publickey")
}
resource "aws_key_pair" "publickey2" {
  count = var.isTesting
  key_name = "hoangdl-publickey"
  public_key = file("${path.module}/testing-publickey")
}