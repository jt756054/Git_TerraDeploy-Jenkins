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
resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.hosting-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}
resource "aws_s3_object" "index-file" {
  bucket = aws_s3_bucket.hosting-bucket.id
  key    = "index.html"
  source = var.source-index
  content_type = "text/html"
}
resource "aws_s3_object" "error-file" {
  bucket = aws_s3_bucket.hosting-bucket.id
  key    = "index.html"
  source = var.source-error
  content_type = "text/html"
}