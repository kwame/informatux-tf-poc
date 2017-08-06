terraform {
  backend "s3" {
    bucket = "informatux-terraform"
    key    = "vpc_peering/peering.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
