variable "container_name" {
  description = "Name of the Docker container"
  type        = string
}

variable "image_name" {
  description = "Name of the Docker image"
  type        = string
}

variable "network_name" {
  description = "Docker network to attach to"
  type        = string
}

variable "internal_port" {
  description = "Internal port the container listens on"
  type        = number
}

variable "external_port" {
  description = "External port to map"
  type        = number
  default     = 0
}

variable "env_vars" {
  description = "Environment variables for the container"
  type        = map(string)
  default     = {}
}

variable "volumes" {
  description = "Volumes to mount in the container"
  type        = list(object({
    container_path = string
    host_path      = string
  }))
  default = []
}
