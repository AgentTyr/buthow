# Creating the zone for buthowdev
# https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html
resource "google_dns_managed_zone" "buthowdev-zone" {
  project     = "buthowdev"
  name        = "buthowdev-zone"
  dns_name    = "buthow.dev."
  description = "Main website DNS Zone"
}

# Creating the records:
# https://www.terraform.io/docs/providers/google/r/dns_record_set.html#name
resource "google_dns_record_set" "root" {
  project      = "buthowdev"
  name         = google_dns_managed_zone.buthowdev-zone.dns_name
  managed_zone = google_dns_managed_zone.buthowdev-zone.name
  type         = "A"
  ttl          = 300

  rrdatas = ["157.245.86.213"]
}

resource "google_dns_record_set" "www" {
  project      = "buthowdev"
  name         = "www.${google_dns_managed_zone.buthowdev-zone.dns_name}"
  managed_zone = google_dns_managed_zone.buthowdev-zone.name
  type         = "CNAME"
  ttl          = 300

  rrdatas = list(google_dns_managed_zone.buthowdev-zone.dns_name)
}

