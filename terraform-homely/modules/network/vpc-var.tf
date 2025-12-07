variable "cidr-block" {
  type = string
}
variable "instance-tenancy" {
  type = string
}
variable "name-tag" {
  type = map(string)
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