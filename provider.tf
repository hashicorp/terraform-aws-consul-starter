# import needed providers for this module

# supplies provider aws by region
provider "aws" {
  region  = var.region
  version = "~> 2.5"
}

# supplies provider random for UUIDs
provider "random" {
  version = "~> 2.2"
}
