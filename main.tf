####----------------------------
#### Calling the vpc module ####
####----------------------------

module "vpc" {
  source  = "git::https://github.com/ArsalanSan/networks.git"
  name    = var.name
  subnets = var.subnets 
}


#### Create VMs ####

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

data "template_file" "file_init" {
  template = file("./file-init.yml")
 
  vars = {
    ssh_public_key = var.ssh_key
  }
}

resource "yandex_compute_instance" "count-vm" {
  
  for_each = module.vpc.map_zone_id

  name        = "dev-vm-${ each.key }"
  platform_id = "standard-v1"
  zone        = each.key

  count = length( module.vpc.subnets_id )

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = each.value 
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    user-data          = data.template_file.file_init.rendered
  }

  depends_on = [ module.vpc ]
}
