resource "aws_s3_bucket" "hosting-bucket" {
  bucket = var.hosting-bucket

  tags = {
    Name = "homely-hosting"
  }
}
resource "aws_s3_bucket_public_access_block" "hosting-bucket" {
  bucket = aws_s3_bucket.hosting-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_policy" "allow-public-access" {
  bucket = aws_s3_bucket.hosting-bucket.id
  policy = data.aws_iam_policy_document.allow-public-access.json
}

data "aws_iam_policy_document" "allow-public-access" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.hosting-bucket.arn,
      "${aws_s3_bucket.hosting-bucket.arn}/*",
    ]
  }
}