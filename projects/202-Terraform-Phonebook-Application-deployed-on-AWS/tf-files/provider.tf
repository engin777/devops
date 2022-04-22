terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.10.0"
    }
    github = {
      source = "integrations/github"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
<<<<<<< HEAD
=======
  profile = "cw-training"
>>>>>>> 981ff908da506dbdfcf5b7facb7d70c69bf9f487
}

provider "github" {
  # Configuration options
<<<<<<< HEAD
  token = "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"
=======
  token = "xxxxxxxxxxxxxxxxxxxxxxxxx"
>>>>>>> 981ff908da506dbdfcf5b7facb7d70c69bf9f487
}