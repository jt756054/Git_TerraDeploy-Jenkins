resource "aws_s3_bucket" "main-bucket" {
  bucket = var.main-bucket

  tags = {
    Name = "homely-main"
  }
}