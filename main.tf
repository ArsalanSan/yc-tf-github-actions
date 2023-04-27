####----------------------------
#### Calling the vpc module ####
####----------------------------

module "vpc" {
  source  = "git::https://github.com/ArsalanSan/networks.git?ref=main"
  name    = var.name
  subnets = var.subnets 
}

