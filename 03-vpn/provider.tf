terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }

  backend "s3" {
    bucket         = "vigneshdev-remote"
    key            = "roboshop-dev-vpn"
    region         = "us-east-1"
    dynamodb_table = "vigneshdev-remote-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}