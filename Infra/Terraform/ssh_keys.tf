resource "digitalocean_ssh_key" "default" {
  name       = "Terraform Example"
  public_key = file("/Users/agenttyr/.ssh/id_rsa.pub")
}