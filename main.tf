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
  endpoint = "http://localhost:4567/api"
  user_uuid="8b5322ea-41bf-4920-8ebc-dee2501bdfcc" 
  token="2e51a260-58cd-400a-b99c-d84f5bc46ad9"
}

#module "terrahouse_aws" {
#  source = "./modules/terrahouse_aws"
#  user_uuid = var.user_uuid
#  bucket_name = var.bucket_name
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
#  content_version = var.content_version
#}


resource "terratowns_home" "home" {
  name = "Orhan testing"
  description = <<DESCRIPTION
orhan testing this site test
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "d7jmypizpnr8.cloudfront.net"
  town = "cooker-cove"
  content_version = 1
}