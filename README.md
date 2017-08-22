# Google Cloud Plateform - Cloud SQL Read Replica

## Example

```
module "sql-rr" {
  source = "github.com/terraform-modules/module-gcp-sql-rr"
  name = "${var.name}"
  region = "${var.region}"
  zone_master = "${var.zone_master}"
  zone_replica = "${var.zone_replica}"
  password = "${var.password}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backup_enabled | Backup activation | string | `false` | no |
| backup_start_time | Start time of the daily backup | string | `02:30` | no |
| cidr_ip_access | A CIDR notation IPv4 or IPv6 address that is allowed to access this instance | string | `0.0.0.0/0` | no |
| database_version | Version of the database (MYSQL_5_6, MYSQL_5_7, POSTGRES_9_6) | string | `MYSQL_5_7` | no |
| disk_autoresize | Auto-resize of the disk if the starting size is exceeded | string | `true` | no |
| disk_size | Storage size in GB | string | `10` | no |
| disk_type_master | Storage Type (SSD ..) | string | `PD_SSD` | no |
| disk_type_replica | Storage Type (SSD ..) | string | `PD_SSD` | no |
| hostname | Hostname for accessing the database | string | `%` | no |
| instance_size_master | size of instance (ex: db-f1-micro) | string | `db-f1-micro` | no |
| instance_size_replica | size of instance (ex: db-f1-micro) | string | `db-f1-micro` | no |
| maintenance_window_day_master | Day of maintenance (integer) | string | `7` | no |
| maintenance_window_day_replica | Day of maintenance (integer) | string | `3` | no |
| maintenance_window_hour_master | Hour of maintenance (integer) | string | `4` | no |
| maintenance_window_hour_replica | Hour of maintenance (integer) | string | `4` | no |
| name | Name of the SQL instance | string | - | yes |
| password | Password of the host to access the database | string | - | yes |
| region | Region of the Instance | string | `europe-west1` | no |
| username | Username of the host to access the database | string | `admin` | no |
| zone_master | Area of the instance (a, b, c, d, e) | string | - | yes |
| zone_replica | Area of the instance (a, b, c, d, e) | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| master_instance_sql_ipv4 | The IPv4 address assigned |
| master_instance_sql_setting_version | Used to make sure changes to the settings block are atomic |
| master_users_self_link | The URL of the created resource |
| replica_instance_sql_ipv4 | The IPv4 address assigned |
| replica_instance_sql_setting_version | Used to make sure changes to the settings block are atomic |
| replica_users_self_link | The URL of the created resource |