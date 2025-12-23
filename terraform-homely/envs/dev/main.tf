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