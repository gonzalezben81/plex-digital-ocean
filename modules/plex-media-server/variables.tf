variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}

variable "plex_ssh_key_name" {
  description = "DigitalOcean SSH Key Name"
  type        = string
}

variable "droplet_region" {
  description = "Droplet Region"
  type        = string
}

variable "droplet_size" {
  description = "Droplet Size"
  type        = string
}

variable "droplet_name" {
  description = "Droplet Name"
  type        = string
}

variable "droplet_image" {
  description = "Droplet Image"
  type        = string
  default = "ubuntu-22-04-x64"
}