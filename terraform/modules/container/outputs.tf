output "container_id" {
  description = "The ID of the Docker container"
  value       = docker_container.this.id
}

output "container_name" {
  description = "The name of the Docker container"
  value       = docker_container.this.name
}
