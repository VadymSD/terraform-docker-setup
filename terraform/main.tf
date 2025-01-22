terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"

  registry_auth {
    address  = "index.docker.io/v1/"
    username = var.docker_username
    password = var.docker_password
  }
}

module "nginx_image" {
  source     = "./modules/image"
  image_name = var.nginx_image_name
}

module "client_image" {
  source     = "./modules/image"
  image_name = var.client_image_name
}

module "server_image" {
  source     = "./modules/image"
  image_name = var.server_image_name
}

module "network" {
  source       = "./modules/network"
  network_name = "my_network"
}

module "nginx_container" {
  source         = "./modules/container"
  container_name = "nginx"
  image_name     = module.nginx_image.image_name
  network_name   = module.network.network_name
  internal_port  = 443
  external_port  = 443

  volumes = [
    {
      container_path = "/etc/nginx/nginx.conf"
      host_path      = abspath("${path.module}/nginx.conf")
    },
    {
      container_path = "/etc/nginx/ssl"
      host_path      = abspath("${path.module}/ssl")
    }
  ]
}

module "client_container" {
  source         = "./modules/container"
  container_name = "client_container"
  image_name     = module.client_image.image_name
  network_name   = module.network.network_name
  internal_port  = 8080
}

module "server_container" {
  source         = "./modules/container"
  container_name = "server_container"
  image_name     = module.server_image.image_name
  network_name   = module.network.network_name
  internal_port  = 8081

  env_vars = {
    DB_URI              = var.db_uri
    DB_NAME             = var.db_name
    DB_COLLECTION_NAME  = var.db_collection_name
  }
}
