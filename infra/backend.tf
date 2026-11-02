terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket       = "pgr301-terraform-state"
    key          = "wishifai/16/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
  }
}