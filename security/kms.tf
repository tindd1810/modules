resource "aws_kms_key" "a" {
  description = "KMS key 1"
  is_enabled = true
  enable_key_rotation = true
  tags =  {
    "Name" = "hoangdl-key1"
  }
}

output "key-id" {
  value = aws_kms_key.a.id
}