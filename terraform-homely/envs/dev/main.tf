module "network" {
  source = "../../modules/network"

  cidr-block = var.cidr-block
  public-subnet-cidr = var.public-subnet-cidr
  private-subnet-cidr = var.private-subnet-cidr
  availability-zone = var.availability-zone
  instance-tenancy = var.instance-tenancy
  name-tag = var.name-tag
}

module "storage" {
  source = "../../modules/storage"

  hosting-bucket = var.hosting-bucket

}

module "iam" {
  source = "../../modules/iam"

  iam_role_name = var.iam_role_name
  trusted_service = var.trusted_service
  managed_policy_arns = var.managed_policy_arns
  iam_instance_profile = var.iam_instance_profile
}

module "compute" {
  source = "../../modules/compute"

  ami = var.ami
  instance_type = var.instance_type
  key_pair = var.key_pair
  public_subnet_ids = module.network.public_subnet_ids
  iam_instance_profile_name = module.iam.jenkins_instance_profile_name
}