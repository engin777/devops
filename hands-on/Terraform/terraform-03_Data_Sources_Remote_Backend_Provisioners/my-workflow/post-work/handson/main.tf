provider "aws" {
  region = "us-east-1"

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
  backend "s3" {
    bucket         = "tf-remote-s3-bucket-engin55-changehere"
    key            = "env/dev/tf-remote-backend.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt        = true
  }
}

data "aws_ami" "tf-ami" {
  most_recent = true
  owners      = ["self"]

  filter {
   name  = "virtualization-type"
   values = ["hvm"]   
  }  
}

locals {
  mytag = "engin"
}

resource "aws_instance" "tf-ec2" {
    ami = data.aws_ami.tf-ami.id
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
        Name = "${local.mytag}-this is from my-ami"
    }

}