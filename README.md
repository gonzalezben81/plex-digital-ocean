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
```

##  Using the Module 📦

```hcl

module "plex_server" {
  source = "git::https://github.com/gonzalezben81/plex-digital-ocean.git?ref=v1.0.0"

  do_token     = var.do_token
  ssh_key_name = var.ssh_key_name
  droplet_name = var.droplet_name
  region       = var.region
  droplet_size = var.droplet_size
  image_type   = var.image_type
}

```

## Digital Ocean Images

https://docs.digitalocean.com/products/droplets/details/images/

For a comprehensive list of Digital Ocean droplet options, please see the link below:

https://slugs.do-api.dev/