# module "network" {
#   source = "../../modules/network"

#   cidr-block = var.cidr-block
#   public-subnet-cidr = var.public-subnet-cidr
#   private-subnet-cidr = var.private-subnet-cidr
#   availability-zone = var.availability-zone
#   instance-tenancy = var.instance-tenancy
#   name-tag = var.name-tag
# }

# module "storage" {
#   source = "../../modules/storage"

#   hosting-bucket = var.hosting-bucket

# }

module "iam_role" {
  source = "../../modules/iam/iam-role"

  iam_role_name = var.iam_role_name
  trusted_service = var.trusted_service
  managed_policy_arns = var.managed_policy_arns
}

module "compute" {
  source = "../../modules/compute"

  ami = var.ami
  instance_type = var.instance_type
}