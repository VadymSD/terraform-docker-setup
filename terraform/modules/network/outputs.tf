output "network_id" {
  description = "The ID of the Docker network"
  value       = docker_network.this.id
}

output "network_name" {
  description = "The name of the Docker network"
  value       = docker_network.this.name
}
