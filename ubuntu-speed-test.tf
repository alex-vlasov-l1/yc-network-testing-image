provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}


data "yandex_compute_image" "ubuntu18" {
  family = "ubuntu-1804-lts"
}

resource "yandex_compute_instance" "yc-iperf" {
  name = "yc-iperf"
  zone  = var.zone_id
  platform_id = "standard-v2"
  resources {
    cores  = 8
    memory =  8
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu18.id
      type     = "network-ssd"
      size     = 30
    }
  }

  network_interface {
    subnet_id  = var.subnet_test
    nat = "true"
  }

  metadata = {
    serial-port-enable = 1
    user-data = file("ubuntu.yaml")
  }
}
