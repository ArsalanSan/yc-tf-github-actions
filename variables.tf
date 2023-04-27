#------------------------------
##### variables for cloud #####
#------------------------------ 

variable "sa_key_file" {
  type        = string
  default     = "key.json"
  description = "Service account key file cloud"
}

/*
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
*/
#--------------------------------
##### variables for module #####
#-------------------------------- 

variable "name" {
  type    = string
  default = "develop"
}

variable "subnets" {
  description = "Create zones && subnets"
  type = list(object(
    {
      zone = string
      cidr = string
    })
  )
  default = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
#    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
#    { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
  ]
}

