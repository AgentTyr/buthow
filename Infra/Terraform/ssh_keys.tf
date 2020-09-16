// Getting the user AgentTyr for SSHKeys.
// https://www.terraform.io/docs/providers/github/d/user.html
data "github_user" "agenttyr" {
  username = "agenttyr"
}

// TODO :: There might be an issue with dynamically adding keys.
// The biggest issue is that each time a key is added, this will result in terraform recreating the pods, which will cause down time.
// As such, we should have a terraform private key which ansible can then use to add all the keys from GitHub.
resource "digitalocean_ssh_key" "agenttyr_keys" {
  // for_each doesn't work with lists, converting to set.
  for_each   = toset(data.github_user.agenttyr.ssh_keys)
  // We don't want the key's name to be the public key, so adding a number behind it.
  name       = "AgentTyr_${index(data.github_user.agenttyr.ssh_keys, each.value) + 1}"
  public_key = each.value
}