resource "google_compute_firewall" "allow_port_80" {
  name = "allow-port-80"
  network = "default"

  allow {
    protocol = "tcp"
    ports = [80]
  }

  source_tags = ["allow-port-80"]
}

resource "google_compute_address" "staticIP" {
  name = "ipv4-address"
}

###
#   Output
###
output "instance_ip" {
  description = "IP of the 'stackstorm' compute instance." 
  value = google_compute_instance.stackstorm.network_interface.0.access_config.0.nat_ip
}