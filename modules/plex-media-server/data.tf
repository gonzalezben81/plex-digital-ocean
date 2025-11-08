# Retrieve SSH key information
data "digitalocean_ssh_key" "ssh" {
  name = var.plex_ssh_key_name # Replace with the actual name of your SSH key in DigitalOcean
}