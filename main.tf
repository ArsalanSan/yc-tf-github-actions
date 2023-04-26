####----------------------------
#### Calling the vpc module ####
####----------------------------

module "vpc" {
  source = "git::https://github.com/ArsalanSan/networks.git?ref=main"
  name = "develop"
  subnets = var.subnets 
}

