terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "sl-tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

###### HTTPD Container

resource "docker_image" "httpd" {
  name         = "httpd:latest"
  keep_locally = false
}

resource "docker_container" "httpd1" {
  image = docker_image.httpd.latest
  name  = "sl-tutorial-httpd"
  ports {
    internal = 80
    external = 8001
  }
}
