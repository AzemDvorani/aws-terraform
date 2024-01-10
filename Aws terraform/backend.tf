terraform {
  backend "s3" {
    bucket         = "azem-bucket" 
    key            = "terraform.tfstate"
    region         = "eu-central-1"
  }
}