module "null-null_resources" {
  source = "./null-res-module"
}

module "resource-count" {
  source = "./resource-count"
  input = module.null-null_resources
}