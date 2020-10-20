variable "token" {
  description = "Ваш Oauth токен"
}
variable "cloud_id" {
  description = "Ваш Cloud Id"
}
variable "folder_id" {
  description = "ID каталога Default"
}

variable "subnet_test" {
  description = "ID of subnet for instance"
}

variable "zone_id" {
  description = "zone for instance"
  default = "ru-central1-a"
}
