
locals {
  role-tags = {
    Name = "homely-jenkins-role"
  }
}

resource "aws_iam_role" "jenkins_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = var.trusted_service
        }
      },
    ]
  })

  tags = local.role-tags
}

resource "aws_iam_role_policy_attachment" "jenkins_attach" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.jenkins_role.name
  policy_arn = each.value
}