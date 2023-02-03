terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "region" {
  default = "us-west-2"
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_security_group" "Ec2_security1" {
  name        = "TerraformEc2_security1"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-05ae32088bccb6d55"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "403a4fb8870c9e7773f579fb6551d8c834e044a0"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-03 17:57:40"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "pvondemhagen"
    git_repo             = "Terraform_AWS_Demo_2"
    yor_trace            = "b1bf81c4-ec9f-46ae-bca9-06f89f291e88"
  }
}

resource "aws_instance" "Prisma_Cloud_demo_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name                 = "PrismaCloudDemoAppServerInstance"
    git_commit           = "403a4fb8870c9e7773f579fb6551d8c834e044a0"
    git_file             = "main.tf"
    git_last_modified_at = "2023-02-03 17:57:40"
    git_last_modified_by = "pvondemhagen@yahoo.com"
    git_modifiers        = "pvondemhagen"
    git_org              = "pvondemhagen"
    git_repo             = "Terraform_AWS_Demo_2"
    yor_trace            = "fd6d861d-5c4f-438c-8547-aa70709e5384"
  }
}