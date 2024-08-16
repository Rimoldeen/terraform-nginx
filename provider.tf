terraform {
  backend "s3" {
    bucket         = "tf-backend-ecstask"
    key            = "backend/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "s3-backend-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "eu-west-2"
  profile = "personalAWS"
}
