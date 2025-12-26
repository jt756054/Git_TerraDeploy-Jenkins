# Git_TerraDeploy-Jenkins
TerraDeploy-Jenkins DevOps Project
Automated Web App Deployment Pipeline (AWS + Terraform + Git + Jenkins)

Project Goal
Build a fully automated CI/CD pipeline where:
Terraform builds AWS infrastructure
AWS hosts a web application (EC2, S3, etc.)
GitHub is the source control
Jenkins automatically deploys updates

Jenkins + Maven Architecture
EC2 -> Jenkins controller
Maven -> build tool
Git -> source control repo
IAM Role -> AWS access
Terraform -> infrastructure
Jenkinsfile -> pipeline definition