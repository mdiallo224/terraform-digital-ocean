terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

// createa new virtual private connection
resource "digitalocean_vpc" "main" {
  name = "main-vpc"
  region = "nyc3"
  ip_range = "10.10.1.0/24"
  description = "Main VPC used for hosting web servers"
}

// create the resource / droplet
resource "digitalocean_droplet" "host2" {
  image  = "rockylinux-9-x64"
  name   = "host2.moucdia.com"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  tags   = ["web"]
  ssh_keys = [var.ssh_fingerprint]
  vpc_uuid = digitalocean_vpc.main.id
}

resource "digitalocean_droplet" "host3" {
  image  = "rockylinux-9-x64"
  name   = "host3.moucdia.com"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  tags   = ["db"]
  ssh_keys = [var.ssh_fingerprint]
  vpc_uuid = digitalocean_vpc.main.id
}
