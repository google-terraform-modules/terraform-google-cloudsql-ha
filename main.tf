locals {
  name_prefix = "${format("%s-%s-%s", var.name, var.env, var.region)}"
}

# Master CloudSQL
# https://www.terraform.io/docs/providers/google/r/sql_database_instance.html
resource "google_sql_database_instance" "new_instance_sql_master" {
  name = "${format("%s-master", local.name_prefix)}"

  region           = "${var.region}"
  database_version = "${var.database_version}"

  settings {
    tier                        = "${var.instance_size_master}"
    disk_type                   = "${var.disk_type_master}"
    disk_size                   = "${var.disk_size}"
    disk_autoresize             = "${var.disk_autoresize}"
    activation_policy           = "${var.activation_policy}"
    authorized_gae_applications = "${var.authorized_gae_applications_master}"

    ip_configuration {
      authorized_networks = {
        name  = "first access"
        value = "${var.cidr_ip_access}"
      }

      require_ssl  = "${var.require_ssl}"
      ipv4_enabled = "${var.ipv4_enabled}"
    }

    location_preference {
      zone = "${format("%s-%s", var.region, var.zone_master)}"
    }

    backup_configuration {
      binary_log_enabled = "true"
      enabled            = "${var.backup_enabled}"
      start_time         = "${var.backup_start_time}"
    }

    maintenance_window {
      day          = "${var.maintenance_window_day_master}"
      hour         = "${var.maintenance_window_hour_master}"
      update_track = "${var.maintenance_update_track}"
    }
  }
}

# Replica CloudSQL
# https://www.terraform.io/docs/providers/google/r/sql_database_instance.html
resource "google_sql_database_instance" "new_instance_sql_replica" {
  name = "${format("%s-replica", local.name_prefix)}"

  region               = "${var.region}"
  database_version     = "${var.database_version}"
  master_instance_name = "${google_sql_database_instance.new_instance_sql_master.name}"

  replica_configuration {
    connect_retry_interval = "${var.connect_retry_interval}"
    failover_target        = "true"
  }

  settings {
    tier                        = "${var.instance_size_replica}"
    disk_type                   = "${var.disk_type_replica}"
    disk_size                   = "${var.disk_size}"
    disk_autoresize             = "${var.disk_autoresize}"
    activation_policy           = "${var.activation_policy}"
    authorized_gae_applications = "${var.authorized_gae_applications_replica}"
    crash_safe_replication      = "true"

    location_preference {
      zone = "${format("%s-%s", var.region, var.zone_replica)}"
    }

    maintenance_window {
      day          = "${var.maintenance_window_day_replica}"
      hour         = "${var.maintenance_window_hour_replica}"
      update_track = "${var.maintenance_update_track}"
    }
  }
}
