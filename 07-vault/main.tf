provider "vault" {
  address = "http://vault-internal.kommanuthala.store:8200"
  token = var.vault_token
}

variable "vault_token" {}


data "vault_kv_secret" "secret_data" {
  path = "test/data/demo"
}

# resource "local_file" "test" {
#   filename = "/tmp/1"
#   content = data.vault_kv_secret.secret_data
# }

# output "name" {
#   value = data.vault_kv_secret.secret_data["username"]
#   sensitive = true
# }

data "vault_generic_secret" "test1" {
  path = "test/demo"
}

resource "local_file" "loal" {
  filename = "tmp/2"
  content = data.vault_generic_secret.test1.data["username"]
}