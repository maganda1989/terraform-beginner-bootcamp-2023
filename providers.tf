terraform {
#   cloud {
#    organization = "terraform-beginner-bootcamp-2023-orhan"

#    workspaces {
#      name = "terra-house"
#   }
#  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
}
provider "random" {
  # Configuration options
}