terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "terraform-beginner-bootcamp-2023-orhan"

  #  workspaces {
  #    name = "terra-house"
  #  }
  #}
  #cloud {
  #  organization = "terraform-beginner-bootcamp-2023-orhan"
  #  workspaces {
  #    name = "terra-house"
  #  }
  #}

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Orhan testing"
  description = <<DESCRIPTION
orhan testing this site test
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "d7jmypizpnr8.cloudfront.net"
  town = "missingo"
  content_version = 1
}