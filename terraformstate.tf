terraform {
  backend "s3" {
    bucket = "informatux-terraform"
    key    = "terraform_poc/poc.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
