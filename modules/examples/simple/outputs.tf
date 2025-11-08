output "droplet_ip" {
  description = "Public IPv4 address of the created Plex Droplet"
  value       = module.plex_server.droplet_ip
}

output "droplet_hourly_cost" {
  description = "Hourly price of the Droplet"
  value       = module.plex_server.droplet_hourly_cost
}

output "droplet_monthly_cost" {
  description = "Monthly price of the Droplet"
  value       = module.plex_server.droplet_monthly_cost
}
