provider "aws" {
  region = var.region
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]
  profile = "training"
}