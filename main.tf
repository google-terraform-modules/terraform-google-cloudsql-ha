locals {
  name_prefix = "${var.general["name"]}-${var.general["env"]}-${var.general["region"]}"
}

# Master CloudSQL
# https://www.terraform.io/docs/providers/google/r/sql_database_instance.html
resource "google_sql_database_instance" "new_instance_sql_master" {
  name             = "${local.name_prefix}-master"
  region           = "${var.general["region"]}"
  database_version = "${lookup(var.general, "db_version", "MYSQL_5_7")}"

  settings {
    tier                        = "${lookup(var.master, "tier", "db-f1-micro")}"
    disk_type                   = "${lookup(var.master, "disk_type", "PD_SSD")}"
    disk_size                   = "${lookup(var.master, "disk_size", 10)}"
    disk_autoresize             = "${lookup(var.master, "disk_auto", true)}"
    activation_policy           = "${lookup(var.master, "activation_policy", "ALWAYS")}"
    availability_type           = "ZONAL"
    replication_type            = "${lookup(var.master, "replication_type", "SYNCHRONOUS")}"
    authorized_gae_applications = "${var.authorized_gae_applications_master}"
    user_labels                 = "${var.labels}"

    ip_configuration {
      require_ssl  = "${lookup(var.master, "require_ssl", false)}"
      ipv4_enabled = "${lookup(var.master, "ipv4_enabled", true)}"
    }

    location_preference {
      zone = "${var.general["region"]}-${var.master["zone"]}"
    }

    backup_configuration {
      binary_log_enabled = true
      enabled            = "${lookup(var.general, "backup_enabled", true)}"
      start_time         = "${lookup(var.general, "backup_time", "02:30")}" # every 2:30AM
    }

    maintenance_window {
      day          = "${lookup(var.master, "maintenance_day", 1)}"          # Monday
      hour         = "${lookup(var.master, "maintenance_hour", 2)}"         # 2AM
      update_track = "${lookup(var.master, "maintenance_track", "stable")}"
    }
  }
}

# Replica CloudSQL
# https://www.terraform.io/docs/providers/google/r/sql_database_instance.html
resource "google_sql_database_instance" "new_instance_sql_replica" {
  name                 = "${local.name_prefix}-replica"
  region               = "${var.general["region"]}"
  database_version     = "${lookup(var.general, "db_version", "MYSQL_5_7")}"
  master_instance_name = "${google_sql_database_instance.new_instance_sql_master.name}"

  replica_configuration {
    # connect_retry_interval = "${lookup(var.replica, "retry_interval", "60")}"
    failover_target = true
  }

  settings {
    tier                        = "${lookup(var.replica, "tier", "db-f1-micro")}"
    disk_type                   = "${lookup(var.replica, "disk_type", "PD_SSD")}"
    disk_size                   = "${lookup(var.replica, "disk_size", 10)}"
    disk_autoresize             = "${lookup(var.replica, "disk_auto", true)}"
    activation_policy           = "${lookup(var.replica, "activation_policy", "ALWAYS")}"
    availability_type           = "ZONAL"
    authorized_gae_applications = "${var.authorized_gae_applications_replica}"
    crash_safe_replication      = true

    location_preference {
      zone = "${var.general["region"]}-${var.replica["zone"]}"
    }

    maintenance_window {
      day          = "${lookup(var.replica, "maintenance_day", 3)}"          # Wednesday
      hour         = "${lookup(var.replica, "maintenance_hour", 2)}"         # 2AM
      update_track = "${lookup(var.replica, "maintenance_track", "stable")}"
    }
  }
}
