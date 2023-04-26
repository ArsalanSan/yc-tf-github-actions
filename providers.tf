terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.89.0"
    }
  }
  required_version = ">=1.3.0"
}

provider "yandex" {
  #token     = var.token
  service_account_key_file = var.sa_key_file
  cloud_id  = "b1gqp5blt5vgc3tneeo8" 
  folder_id = "b1gvel5rak0sd02laom7"
#  zone      = var.default_zone
}
