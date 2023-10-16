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
  cloud {
    organization = "terraform-beginner-bootcamp-2023-orhan"
    workspaces {
      name = "terraform-cloud"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_Highlander_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.Highlander.public_path
  content_version = var.Highlander.content_version

}

resource "terratowns_home" "home" {
  name = "Highland meadows soup!"
  description = <<DESCRIPTION
Turkish yogurt soup, or yayla corbasi is a traditional soup that's made primarily with yogurt
DESCRIPTION
  domain_name = module.home_Highlander_hosting.domain_name
  town = "cooker-cove"
  content_version = var.Highlander.content_version
  
}

module "home_king_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.king.public_path
  content_version = var.king.content_version
  
}

resource "terratowns_home" "home_king" {
  name = "A sad story about gaming"
  description = <<DESCRIPTION
A page about my favorite game League of legends.
DESCRIPTION
  domain_name = module.home_king_hosting.domain_name
  town = "gamers-grotto"
  content_version = var.king.content_version
}

