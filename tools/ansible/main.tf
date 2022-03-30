###
#   Variables
###
variable "projectId" {
  default = "the-lab-automation"
} 
variable "region" {
  default = "europe-west1"
}
variable "zone" {
  default = "europe-west1-b"
}
variable "vmType" {
  default = "n1-standard-1"
}
variable "image" {
  default = "ubuntu-2004-focal-v20220204"
}
variable "gce_ssh_user" {
  default = "ansible"
}
variable "gce_ssh_pub_key_file" {
  default = "./sshKeys/ansible-key.pub"
}
###
#   Provider
### 
provider "google" {
  project     = var.projectId
  region      = var.region
  zone        = var.zone
}

###
#   Firewall rule
###
resource "google_compute_firewall" "allow_port_80" {
  name = "allow-port-80"
  network = "default"

  allow {
    protocol = "tcp"
    ports = [80]
  }

  source_tags = ["allow-port-80"]
}
###
#   VM instance
###
resource "google_compute_instance" "ansible" {
  name           = "ansible-node"
  machine_type   = var.vmType
  zone           = var.zone

  # allow http traffic (port 80)
  tags = ["allow-port-80"]
  
  boot_disk {
    initialize_params {
      image     = var.image 
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  # Update the system, install python3.9 (necessary) and add the ansible user.
  metadata_startup_script = "apt update -y && apt install -y python3.9 && sudo useradd -s /bin/bash -d /home/ansible/ -m -G sudo ansible"

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}

###
#   Local-exec: create the hosts file that is needed to execute the playbook on the ansible-node
###
resource "null_resource" "local_exec" {
  provisioner "local-exec" {
    command = "terraform refresh && printf \"[appserver]\n$(terraform output -raw instance_ip) ansible_ssh_user=ansible ansible_ssh_private_key_file=~/.ssh/ansible-key\" > hosts"
  }

  depends_on = [
    google_compute_instance.ansible
  ]
}

###
#   Output
###
output "instance_ip" {
  description = "IP of the 'ansible' compute instance." 
  value = google_compute_instance.ansible.network_interface.0.access_config.0.nat_ip
}