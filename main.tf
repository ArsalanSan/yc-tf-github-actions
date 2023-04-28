####----------------------------
#### Calling the vpc module ####
####----------------------------

module "vpc" {
  source  = "git::https://github.com/ArsalanSan/networks.git"
  name    = var.name
  subnets = var.subnets 
}

