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

variable "gcp_sql_root_password" {}
variable "gcp_sql_default_user" {}
variable "gcp_sql_default_pass" {}
variable "gcp_sql_default_root" {}
variable "gcp_sql_newUser_pass" {}

variable "gcp_vm_user" {}
variable "gcp_vm_pass" {}