# Grabbing the DNSZone that is already created in cloudflare.
# data cloudflare_zones is a search, so it returns an array of zones.
data "cloudflare_zones" "buthow" {
  filter {
    name = "buthow.dev"
  }
}

# Creating the root zone, using the name @
resource "cloudflare_record" "buthow_root" {
  # Since only one domain exists exactly for the search, we can use the first result
  zone_id = data.cloudflare_zones.buthow.zones[0].id
  name    = "@"
  value   = "157.245.86.213"
  type    = "A"
  ttl     = 3600
}

# Creating the root zone, using the name @
resource "cloudflare_record" "buthow_www" {
  # Since only one domain exists exactly for the search, we can use the first result
  zone_id = data.cloudflare_zones.buthow.zones[0].id
  name    = "www"
  value   = "buthow.dev"
  type    = "CNAME"
  ttl     = 3600
}
