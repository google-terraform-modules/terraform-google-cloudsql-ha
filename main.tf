locals {
  name_prefix = "${var.name}-${var.env}-${var.region}"
}

resource "google_sql_database_instance" "new_instance_sql_master" {
  name = "${local.name_prefix}-master"

  region           = "${var.region}"
  database_version = "${var.database_version}"

  settings {
    tier            = "${var.instance_size_master}"
    disk_type       = "${var.disk_type_master}"
    disk_size       = "${var.disk_size}"
    disk_autoresize = "${var.disk_autoresize}"

    ip_configuration {
      authorized_networks = {
        name  = "first access master"
        value = "${var.cidr_ip_access}"
      }

      require_ssl  = "${var.require_ssl}"
      ipv4_enabled = "${var.ipv4_enabled}"
    }

    location_preference {
      zone = "${var.region}-${var.zone_master}"
    }

    backup_configuration {
      binary_log_enabled = "true"
      enabled            = "true"
      start_time         = "${var.backup_start_time}"
    }

    maintenance_window {
      day  = "${var.maintenance_window_day_master}"
      hour = "${var.maintenance_window_hour_master}"
    }
  }
}

resource "google_sql_database_instance" "new_instance_sql_replica" {
  name = "${local.name_prefix}-replica"

  region               = "${var.region}"
  database_version     = "${var.database_version}"
  master_instance_name = "${google_sql_database_instance.new_instance_sql_master.name}"

  replica_configuration {
    connect_retry_interval = "${var.connect_retry_interval}"
    failover_target        = "true"
  }

  settings {
    tier            = "${var.instance_size_replica}"
    disk_type       = "${var.disk_type_replica}"
    disk_size       = "${var.disk_size}"
    disk_autoresize = "${var.disk_autoresize}"

    location_preference {
      zone = "${var.region}-${var.zone_replica}"
    }

    maintenance_window {
      day  = "${var.maintenance_window_day_replica}"
      hour = "${var.maintenance_window_hour_replica}"
    }
  }
}

resource "google_sql_user" "new_instance_sql_users" {
  count    = "${length(var.username)}"
  instance = "${google_sql_database_instance.new_instance_sql_master.name}"
  host     = "${element(var.hostname, count.index)}"
  name     = "${element(var.username, count.index)}"
  password = "${element(var.password, count.index)}"
}
