variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "iam_instance_profile_name" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "key_pair" {
  type = string
}