# Google CloudSQL cluster (RR)

Compatible provider `1.3-1.5`

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

For the password, you can use the [random provider](https://www.terraform.io/docs/providers/random/index.html) :
```hcl
resource "random_string" "password" {
  length  = 16
  special = true
  number  = true
  lower   = true
  upper   = true
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name of the SQL instance | string | - | yes |
| env | Environment | string | - | yes |
| region | Region of the Instance | string | `europe-west1` | no |
| zone_master | Area of the instance master (a, b, c, d, e) | string | - | yes |
| zone_replica | Area of the instance replica (a, b, c, d, e) | string | - | yes |
| database_version | Version of the database (MYSQL_5_6, MYSQL_5_7, POSTGRES_9_6) | string | `MYSQL_5_7` | no |
| disk_size | Storage size in GB | string | `10` | no |
| disk_autoresize | Auto-resize of the disk if the starting size is exceeded | string | `true` | no |
| disk_type_master | Storage type master (SSD ..) | string | `PD_SSD` | no |
| disk_type_replica | Storage type replica (SSD ..) | string | `PD_SSD` | no |
| backup_start_time | Start time of the daily backup | string | `02:30` | no |
| cidr_ip_access | A CIDR notation IPv4 or IPv6 address that is allowed to access this instance | string | `0.0.0.0/0` | no |
| connect_retry_interval | The number of seconds between connect retries. | string | `60` | no |
| instance_size_master | size of instance master (ex: db-f1-micro) | string | `db-f1-micro` | no |
| instance_size_replica | size of instance replica (ex: db-f1-micro) | string | `db-f1-micro` | no |
| ipv4_enabled | Instance should be assigned an IP address | string | `true` | no |
| maintenance_window_day_master | Day of maintenance master (integer) | string | `7` | no |
| maintenance_window_day_replica | Day of maintenance replica (integer) | string | `3` | no |
| maintenance_window_hour_master | Hour of maintenance master (integer) | string | `4` | no |
| maintenance_window_hour_replica | Hour of maintenance replica (integer) | string | `4` | no |
| require_ssl | Connection SSL is required | string | `false` | no |
| hostname | Hostname for accessing the database | list | `<list>` | no |
| username | Username of the host to access the database | list | `<list>` | no |
| password | Password of the host to access the database | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| master_instance_sql_ipv4 | The IPv4 address assigned for master |
| master_instance_sql_setting_version | Used to make sure changes to the settings block are atomic |
| master_settings_version | Master settings version |
| master_users_self_link | The URL of the created resource |
| replica_instance_sql_ipv4 | The IPv4 address assigned for replica |
| replica_instance_sql_setting_version | Used to make sure changes to the settings block are atomic |
| replica_settings_version | Replica settings version |
| replica_users_self_link | The URL of the created resource |