data "digitalocean_ssh_key" "ssh" {
  name = var.plex_ssh_key_name
}
