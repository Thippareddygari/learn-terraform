provider "vault" {
  address = "http://vault-internal.kommanuthala.store:8200"
  token = var.vault_token
}

variable "vault_token" {}


data "vault_kv_secret" "secret_data" {
  path = "test/data/demo"
}

resource "local_file" "test" {
  filename = "/tmp/1"
  content = data.vault_kv_secret.secret_data
}

output "name" {
  value = data.vault_kv_secret.secret_data["username"]
  sensitive = true
}