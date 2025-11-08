variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "plex_ssh_key_name" {
  description = "Name of the SSH key registered in DigitalOcean"
  type        = string
}

variable "droplet_name" {
  description = "Name of the Plex droplet"
  type        = string
  default     = "plex-media-server"
}

variable "droplet_region" {
  description = "DigitalOcean region for deployment"
  type        = string
  default     = "nyc3"
}

variable "droplet_size" {
  description = "Droplet size slug (e.g., s-1vcpu-1gb)"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "droplet_image" {
  description = "Droplet image slug (e.g., ubuntu-22-04-x64)"
  type        = string
  default     = "ubuntu-22-04-x64"
}
