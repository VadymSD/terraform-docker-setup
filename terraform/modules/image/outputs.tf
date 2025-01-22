output "image_id" {
  description = "The ID of the Docker image"
  value       = docker_image.this.id
}

output "image_name" {
  description = "The name of the Docker image"
  value       = docker_image.this.name
}
