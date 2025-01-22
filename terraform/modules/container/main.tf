terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_container" "this" {
  name    = var.container_name
  image   = var.image_name

  networks_advanced {
    name = var.network_name
  }

  env = [for key, value in var.env_vars : "${key}=${value}"]

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  dynamic "volumes" {
    for_each = var.volumes
    content {
      container_path = volumes.value.container_path
      host_path      = volumes.value.host_path
    }
  }
}
