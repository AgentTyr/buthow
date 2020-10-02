// Getting the user AgentTyr for SSHKeys.
// https://www.terraform.io/docs/providers/github/d/user.html
data "github_user" "agenttyr" {
  username = "agenttyr"
}

