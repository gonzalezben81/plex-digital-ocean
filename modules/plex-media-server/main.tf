terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.68.0"
    }
  }

  required_version = ">= 1.5.0"
}



# Create the DigitalOcean Droplet
resource "digitalocean_droplet" "plex_media_server" {
  name   = var.droplet_name
  region = var.droplet_region           # Replace with your preferred region
  size   = var.droplet_size      # Choose a size suitable for your application
  image  = var.droplet_image # Ensure the image ID is available on DigitalOcean

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
