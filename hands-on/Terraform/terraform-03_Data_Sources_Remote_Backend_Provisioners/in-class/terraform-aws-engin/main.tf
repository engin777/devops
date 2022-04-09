provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
  backend "s3" {
    bucket = "tf-remote-s3-bucket-engin8-changehere"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}

locals {
  mytag = "engin-local-name"
}

data "aws_ami" "tf_ami" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "tf-ec2" {
  ami           = data.aws_ami.tf_ami.id
  instance_type = var.ec2_type
  key_name      = "firstkey"
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}

#resource "aws_s3_bucket" "tf-s3" {
  #bucket = "${var.s3_bucket_name}-${count.index}"
 #count = var.num_of_buckets
 #count = var.num_of_buckets !=0 ? var.num_of_buckets :3
 #for_each = toset(var.users)
 #bucket = "exam-tf-s3-bucket-${each.value}"
#}

#resource "aws_iam_user" "new_users" {
 # for_each = toset(var.users)
  #name = each.value
#}

#output "uppercase_users" {
 # value = [for user in var.users : upper(user) if length(user) > 6]
#}
output "test" {
  value = aws_instance.tf-ec2.arn
  }

output "test2" {
  value = aws_instance.tf-ec2.availability_zone
  }