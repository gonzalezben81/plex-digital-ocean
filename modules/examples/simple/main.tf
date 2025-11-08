terraform {
  required_version = ">= 1.1.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.25.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

module "plex_server" {
  source  = "gonzalezben81/plex-media-server/digitalocean"
  version = "0.1.18"

  do_token          = var.do_token
  plex_ssh_key_name = var.plex_ssh_key_name
  droplet_name      = var.droplet_name
  droplet_region    = var.droplet_region
  droplet_size      = var.droplet_size
  droplet_image     = var.droplet_image
}

output "droplet_ip" {
  value = module.plex_server.droplet_ip
}
