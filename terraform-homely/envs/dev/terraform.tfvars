#provider
region = "us-east-1"

##network
cidr-block = "10.173.0.0/16"
instance-tenancy = "default"
name-tag = {
  Name = "homely-vpc"
}
public-subnet-cidr = [ "10.173.0.0/24", "10.173.1.0/24", "10.173.2.0/24" ]
private-subnet-cidr = [ "10.173.3.0/24", "10.173.4.0/24", "10.173.5.0/24" ]
availability-zone = [ "us-east-1a", "us-east-1b", "us-east-1c" ]

##storage
hosting-bucket = "homely-hosting-bucket-001"

##iam
iam_role_name = "jenkins-homely-role"
trusted_service = "ec2.amazonaws.com"
managed_policy_arns = [ "arn:aws:iam::aws:policy/AdministratorAccess" ] ##not safe for production. security risk. Specify arns for production
iam_instance_profile = "jenkins_profile"

##compute
ami = "ami-0ecb62995f68bb549"
instance_type = "t2.medium"