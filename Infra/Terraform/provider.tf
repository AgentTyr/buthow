provider "google" {
  credentials = file("~/account.json")
  project     = "buthowdev"
  region      = "us-east4"
  zone        = "us-east4-c"
}
provider "github" {
}