resource "google_compute_instance" "stackstorm" {
  name           = "terraform-stackstorm"
  machine_type   = var.vmType
  zone           = var.zone

  # allow http traffic (port 80)
  tags = ["http-server"]
  
  boot_disk {
    initialize_params {
      image     = var.image 
    }
  }

  network_interface {
    network = "default"
    access_config {
        nat_ip = google_compute_address.staticIP.address
    }
     
  }
  metadata_startup_script = "apt update -y && apt install -y python3.9 && sudo useradd -s /bin/bash -d /home/ansible/ -m -G sudo ansible"
   metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}

resource "null_resource" "local_exec_2" {
  provisioner "local-exec" {
    command = "terraform refresh && printf \"[stackserver]\n$(terraform output -raw instance_ip) ansible_ssh_user=ansible ansible_ssh_private_key_file=~/.ssh/stackstormKey\" > hostsFile"
  }

  depends_on = [
    google_compute_instance.stackstorm
  ]
}

resource "null_resource" "playbook_run" {
  provisioner "local-exec" {
    command = "ansible-playbook -i hostsFile ./ansible-st2/stackstorm?yml"
  
  }
  depends_on = [
    null_resource.local_exec_2
  ]
}


