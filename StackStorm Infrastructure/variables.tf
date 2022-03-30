variable "projectId" {
  default = "the-lab-automation"
} 

variable "region" {
  default = "europe-west1"
}
variable "zone" {
  default = "europe-west1-b"
}
variable "image" {
  default = "ubuntu-2004-focal-v20220204"
}
variable "vmType" {
  default = "n1-standard-1"
}

variable "gce_ssh_user" {
  default = "ansible"
}
variable "gce_ssh_pub_key_file" {
  default = "~/.ssh/stackstormKey.pub"
}