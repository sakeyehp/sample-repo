terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }

  backend "s3" {
    bucket = "sample-bucket-1212312312131"
    key = "terraform.tfstate"
    region = "us-east-2"
  }

  required_version = ">=1.2.0"
}

provider "aws" {
  region = "us-east-2"
  secret_key = var.secret_key
  access_key = var.access_key
}