terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}
provider "aws" {
    region = "us-east-1" # Configuration options
}
locals {
  mytag = "engin-local"
}
resource "aws_instance" "tf-ec2" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    key_name = "key-name"
    tags = {
        "Name" = "${local.mytag}"
    }
}

resource "aws_s3_bucket" "tf-s3" {
  # bucket = "var.s3_bucket_name.${count.index}"
  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 1
  for_each = toset(var.users)
  bucket   = "exa-tf-s3-bucket-${each.value}"
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)
  name = each.value
}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 6]
}
