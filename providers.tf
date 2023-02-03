provider "aws" {
  region = "us-west-1"
  alias = "region1"
}

provider "aws" {
  region = "us-west-2"
  alias = "region2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}