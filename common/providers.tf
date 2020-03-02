provider "aws" {
  version = "~> 2.50"

  region = var.region
}

provider "random" {
  version = "~> 2.2"
}

provider "http" {
  version = "~> 1.1"
}

provider "template" {
  version = "~> 2.1"
}