terraform {
  required_version = ">= 1.0.0"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.0"
    }
  }
}

# Объявляем переменную для приватного ключа
variable "ssh_private_key" {
  type      = string
  sensitive = true
}

resource "null_resource" "vps_configuration" {
  connection {
    type        = "ssh"
    user        = "root"
    host        = "91.205.220.142" # Замени на свой IP
    private_key = var.ssh_private_key      # Берем ключ из переменной
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "echo '=== Старт настройки сервера через Terraform в GitHub Actions ==='",
      "sudo apt-get update -y",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg",
      "echo '=== Terraform из GitHub успешно подготовил сервер! ===' > /root/terraform_status.txt"
    ]
  }
}