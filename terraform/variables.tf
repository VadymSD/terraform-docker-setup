variable "docker_username" {
  description = "Your Docker Hub username"
  type        = string
}

variable "docker_password" {
  description = "Your Docker Hub password or access token"
  type        = string
  sensitive   = true
}

variable "db_uri" {
  description = "The URI of the database"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_collection_name" {
  description = "The name of the database collection"
  type        = string
}

variable "client_image_name" {
  description = "The name of the client docker image"
  type        = string
}

variable "server_image_name" {
  description = "The name of the server docker image"
  type        = string
}

variable "nginx_image_name" {
  description = "The name of the nginx docker image"
  type        = string
}
