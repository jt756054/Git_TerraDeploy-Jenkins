#provider
variable "region" {
  type = string
}

##network
variable "cidr-block" {
  type = string
}
variable "public-subnet-cidr" {
  type = list(string)
}
variable "private-subnet-cidr" {
  type = list(string)
}
variable "availability-zone" {
  type = list(string)
}
variable "instance-tenancy" {
  type = string
}
variable "name-tag" {
  type = map(string)
}

##storage
variable "hosting-bucket" {
  type = string
}


##iam
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

##compute
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}