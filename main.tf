module "plex_server" {
  source = "./modules/plex-media-server"

  do_token          = var.do_token
  plex_ssh_key_name = var.plex_ssh_key_name
  droplet_name      = var.droplet_name
  droplet_region    = var.droplet_region
  droplet_size      = var.droplet_size
  droplet_image     = var.droplet_image
}
