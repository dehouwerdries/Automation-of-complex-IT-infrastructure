terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  project     = var.projectId
  region      = var.region
  zone        = var.zone
  
}

#+++++++++++++++++++++++#
###
#   GCP network
###
#+++++++++++++++++++++++#
###
#   VPC Network
###
resource "google_compute_network" "vpc" {
  name = "terraform-vpc"
  auto_create_subnetworks = "false"
}

###
#   VPC Subnet
###
resource "google_compute_subnetwork" "vpc_subnet" {
  name = "vpc-subnet"
  region = var.region
  network = google_compute_network.vpc.name
  ip_cidr_range = "192.168.0.0/24"
}

#+++++++++++++++++++++++#
###
#   GCP Database
###
#+++++++++++++++++++++++#

resource "random_id" "db_name_suffix" {
  byte_length = 4
}


resource "google_sql_database" "gcp-cloud-sqldb" {
  name     = "lab-db"
  instance = google_sql_database_instance.gcp-cloud-sql.name
}

resource "google_sql_database_instance" "gcp-cloud-sql" {
  
  name   = "lab-sqlserver-${random_id.db_name_suffix.hex}"
  region = var.region

  # We use mysql 5.7 to make it compastible with our old .NET project
  database_version = "MYSQL_5_7"
  settings {
    tier = "db-n1-standard-1"

    ip_configuration {
      ipv4_enabled    = true
      # Temporarily open up to everything
      authorized_networks {
        name = "all-access"
        value = "0.0.0.0/0"
      }
    }

    backup_configuration {
      enabled = true
      start_time = "03:30"
      backup_retention_settings {
        retained_backups = 7
      }
      binary_log_enabled = true
    }
  }

  # Root password
  root_password = var.gcp_sql_root_password

  # Protect the db from deletion by Terraform
  # "true" = no deletion by Terraform, this needs to happen manually in the GCP console
  # Value is set to "false" for testing purposes 
  deletion_protection  = "false"
}

#Create  a default user

resource "google_sql_user" "gcp-sql-defaultuser" {
  name     = var.gcp_sql_default_user
  instance = google_sql_database_instance.gcp-cloud-sql.name
  password = var.gcp_sql_default_pass
}

###
#   VM instance
###
# resource "google_compute_instance" "webApp" {
#   name           = "terraform-dotnetapp"
#   machine_type   = var.vmType
#   zone           = var.zone

#   # allow http traffic (port 80)
#   tags = ["http-server"]
  
#   boot_disk {
#     initialize_params {
#       image     = var.image 
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {}
#   }

#   metadata = {

#     connectionString="Server=${google_sql_database_instance.gcp-cloud-sql.public_ip_address}; Port=3306; Database=${google_sql_database.gcp-cloud-sqldb.name}; Uid=${ var.gcp_sql_default_user}; Pwd=${var.gcp_sql_default_pass}; SslMode=Preferred;"
# }

#   metadata_startup_script = file("./appScript.sh")
# }


## Changes to the plan


#Changing our app Vm machine tier

resource "google_compute_instance" "webapp" {
  name           = "terraform-dotnetapp-n2"
  machine_type   = "n2-standard-2"
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
    access_config {}
  }

  metadata = {

    connectionString="Server=${google_sql_database_instance.gcp-cloud-sql.public_ip_address}; Port=3306; Database=${google_sql_database.gcp-cloud-sqldb.name}; Uid=${ var.gcp_sql_default_user}; Pwd=${var.gcp_sql_default_pass}; SslMode=Preferred;"
}

  metadata_startup_script = file("./appScript.sh")
}

resource "google_sql_user" "newUser" {
  name     = "newUser"
  instance = google_sql_database_instance.gcp-cloud-sql.name
  password = var.gcp_sql_newUser_pass
}

