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
variable "source-index" {
  type = string
}
variable "source-error" {
  type = string
}