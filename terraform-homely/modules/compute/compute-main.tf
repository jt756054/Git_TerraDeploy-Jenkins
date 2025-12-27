locals {
  jenkins-tags = {
    Name = "homely-jenkins-server"
  }
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id = var.public_subnet_ids[0]

  iam_instance_profile = var.iam_instance_profile_name
  user_data = file("${path.module}/../../code/user-data.sh")

  tags = local.jenkins-tags
}