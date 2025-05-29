# DigitalOcean Plex Media Server Terraform Module

This Terraform configuration deploys a Plex Media Server on a DigitalOcean Droplet using `cloud-init` for initial setup. It includes automatic package installation, user creation, and firewall configuration.

## 🚀 Features

- Creates a Droplet with a specified size, region, and image.
- Installs Plex Media Server via `cloud-init`.
- Adds an SSH key for secure access.
- Configures firewall rules (UFW) to allow Plex traffic.
- Outputs the public IP address of the Droplet.

## 📦 Requirements

- [Terraform](https://www.terraform.io/downloads.html) >= 1.1
- DigitalOcean account and [Personal Access Token](https://cloud.digitalocean.com/account/api/tokens)
- A registered SSH key in your DigitalOcean account

## 🔧 Terraform Provider

```hcl
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.25.0"
    }
  }
}
