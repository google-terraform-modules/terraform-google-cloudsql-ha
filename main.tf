module "new_instance_sql_master" {
  source = "github.com/terraform-modules/module-gcp-sql-simple"
  name = "${var.name}-master"
  region = "${var.region}"
  zone = "${var.zone_master}"
  database_version = "${var.database_version}"
  instance_size = "${var.instance_size_master}"
  disk_type = "${var.disk_type_master}"
  disk_size = "${var.disk_size}"

  maintenance_window_day = "${var.maintenance_window_day_master}"
  maintenance_window_hour = "${var.maintenance_window_hour_master}"
  backup_binary_log_enabled = "true"
  backup_enabled = "${var.backup_enabled}"
  backup_start_time = "${var.backup_start_time}"

  cidr_ip_access = "${var.cidr_ip_access}"
  hostname = "${var.hostname}"
  username = "${var.username}"
  password = "${var.password}"
}

resource "google_sql_database_instance" "new_instance_sql_failover" {
  name = "${var.name}-replica"

  region = "${var.region}"
  database_version = "${var.database_version}"
  master_instance_name = "${var.name}-master"

  replica_configuration {
    connect_retry_interval = 30
    failover_target = true
  }

  settings {
    tier = "${var.instance_size_replica}"
    disk_type = "${var.disk_type_replica}"
    disk_size = "${var.disk_size}"
    disk_autoresize = "${var.disk_autoresize}"

    location_preference {
      zone = "${var.region}-${var.zone_replica}"
    }

    maintenance_window {
      day = "${var.maintenance_window_day_replica}"
      hour = "${var.maintenance_window_hour_replica}"
    }
  }
}