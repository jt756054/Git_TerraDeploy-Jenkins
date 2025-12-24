output "iam_compute_role_name" {
  value = aws_iam_role.jenkins_role.name
}

output "iam_compute_role_arn" {
  value = aws_iam_role.jenkins_role.arn
}