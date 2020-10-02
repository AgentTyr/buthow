// https://www.terraform.io/docs/backends/types/gcs.html
// Using GCSC, we can upload the state using s3.
terraform {
  backend "gcs" {
    bucket  = "buthowdev"
    prefix  = "terraform/state"
  }
}
