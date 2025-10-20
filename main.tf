terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.25.0" # Use the latest stable version
    }
  }
}

# Provider configuration
provider "digitalocean" {
  token = var.do_token # Ensure this variable is defined in your Terraform variables file
}

# Retrieve SSH key information
data "digitalocean_ssh_key" "ssh" {
  name = "finalrstudio" # Replace with the actual name of your SSH key in DigitalOcean
}

# Create the DigitalOcean Droplet
resource "digitalocean_droplet" "example" {
  name   = "plex-droplet"
  region = "nyc3"             # Replace with your preferred region
  size   = "s-1vcpu-1gb"      # Choose a size suitable for your application
  image  = "ubuntu-22-04-x64" # Ensure the image ID is available on DigitalOcean

  ssh_keys = [data.digitalocean_ssh_key.ssh.id]

  # Cloud-init script
  user_data = <<EOT
#cloud-config
package_update: true
package_upgrade: true

users:
  - name: plex
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    shell: /bin/bash

packages:
  - gdebi-core
  - net-tools
  - git

runcmd:
  - apt-get update
  - curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
  - echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
  - apt-get update
  - apt install plexmediaserver
  - systemctl status plexmediaserver
  - sudo systemctl enable plexmediaserver.service
  - ufw allow 32400
  - apt install net-tools
  - apt-get install -y git


final_message: "The system is finally up, and the plex media server is running!"
EOT

  tags = ["plex-media-server"]
}

# Output the droplet IP
output "droplet_ip" {
  value = digitalocean_droplet.example.ipv4_address
}
