terraform {
  required_providers {
    digitalocean = {
      // Need to set the following ENV variables:
      // https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
      // DIGITALOCEAN_TOKEN :: API token which.
      source  = "digitalocean/digitalocean"
      version = "1.22.2"
    }
    cloudflare = {
      // Need the following ENV variables set:
      // https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
      // CLOUDFLARE_API_TOKEN :: API token for cloudflare.
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}