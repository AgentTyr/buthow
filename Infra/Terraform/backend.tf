// https://www.terraform.io/docs/backends/types/s3.html
// Using Digital Ocean's spaces, we can upload the state using s3.
// Guide: https://www.digitalocean.com/community/questions/spaces-as-terraform-backend
terraform {
  backend "s3" {
    bucket = "buthow-private"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    endpoint = "https://nyc3.digitaloceanspaces.com"
    // Enviroment Variables needed:
    // AWS_ACCESS_KEY_ID :: Spaces Key
    // AWS_SECRET_ACCESS_KEY :: Spaces secret
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
  }
}
