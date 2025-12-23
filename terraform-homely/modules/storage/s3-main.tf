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

resource "aws_s3_bucket_policy" "hosting-bucket-policy" {
  bucket = aws_s3_bucket.hosting-bucket.id

  depends_on = [ 
    aws_s3_bucket_public_access_block.hosting-bucket
   ]
   
  policy = jsonencode({
  Version = "2012-10-17"
    Statement = [
      {
        Sid = "PublicReadGetObject"
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.hosting-bucket.arn}/*"
      }
    ]
  })
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

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.hosting-bucket.id

  key = "index.html"
  content = file("${path.module}/../../code/index.html")
  content_type = "text/html"
  etag = filemd5("${path.module}/../../code/index.html")
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.hosting-bucket.id

  key = "error.html"
  content = file("${path.module}/../../code/error.html")
  content_type = "text/html"
  etag = filemd5("${path.module}/../../code/error.html")
}
