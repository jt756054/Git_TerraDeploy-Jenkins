locals {
  jenkins-tags = {
    Name = "homely-jenkins-server"
  }
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  user_data = file("${path.module}/../../code/user-data.sh")

  tags = local.jenkins-tags
}