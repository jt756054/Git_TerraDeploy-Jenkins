output "iam_compute_role_name" {
  value = aws_iam_role.jenkins_role.name
}

output "iam_compute_role_arn" {
  value = aws_iam_role.jenkins_role.arn
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.jenkins_profile.name
}