variable "iam_role_name" {
  type = string
}

variable "trusted_service" {
  type = string
}

variable "managed_policy_arns" {
  type = list(string)
}

variable "iam_instance_profile" {
  type = string
}