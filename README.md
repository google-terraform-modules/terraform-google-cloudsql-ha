# Google Cloud SQL Cluster (HA-RR)

Compatible provider `1.8`

## Example

* europe-west1, 1 master (zone b), 1 failover-replica (zone c), db-f1-micro
```hcl
module "sql-rr" {
  source = "./terraform-google-cloudsql-rr"

  name             = "mydatabase"
  zone_master      = "b"
  zone_replica     = "c"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name of the SQL instance | string | - | yes |
| env | Environment | string | `dev` | no |
| region | Region of the Instance | string | `europe-west1` | no |
| zone_master | Area of the instance master (a, b, c, d, e) | string | - | yes |
| zone_replica | Area of the instance replica (a, b, c, d, e) | string | - | yes |
| database_version | he MySQL version to use. Can be MYSQL_5_6, MYSQL_5_7 or POSTGRES_9_6 for second-generation instances, or MYSQL_5_5 or MYSQL_5_6 for first-generation instances. See Second Generation Capabilities for more information. POSTGRES_9_6 support is in Beta | string | `MYSQL_5_7` | no |
| disk_size | The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased | string | `10` | no |
| disk_autoresize | Configuration to increase storage size automatically | string | `true` | no |
| disk_type_master | The type of data disk for master: PD_SSD or PD_HDD | string | `PD_SSD` | no |
| disk_type_replica | The type of data disk for replica: PD_SSD or PD_HDD | string | `PD_SSD` | no |
| backup_enabled | True if backup configuration is enabled | string | `true` | no |
| backup_start_time | HH:MM format time indicating when backup configuration starts. | string | `02:30` | no |
| cidr_ip_access | A CIDR notation IPv4 or IPv6 address that is allowed to access this instance | string | `0.0.0.0/0` | no |
| connect_retry_interval | The number of seconds between connect retries. | string | `60` | no |
| instance_size_master | size of instance master (ex: db-f1-micro) | string | `db-f1-micro` | no |
| instance_size_replica | size of instance replica (ex: db-f1-micro) | string | `db-f1-micro` | no |
| ipv4_enabled | True if the instance should be assigned an IP address. The IPv4 address cannot be disabled for Second Generation instances | string | `true` | no |
| maintenance_update_track | Receive updates earlier (canary) or later (stable) | string | `stable` | no |
| maintenance_window_day_master | Day of week (1-7), starting on Monday | string | `7` | no |
| maintenance_window_day_replica | Day of week (1-7), starting on Monday | string | `3` | no |
| maintenance_window_hour_master | Hour of day (0-23), ignored if day not set | string | `4` | no |
| maintenance_window_hour_replica | Hour of day (0-23), ignored if day not set | string | `4` | no |
| require_ssl | True if mysqld should default to REQUIRE X509 for users connecting over IP | string | `false` | no |
| activation_policy | For Second Generation instances, the activation policy is used only to start or stop the instance. Setting the activation policy to ALWAYS starts the instance, and setting it to NEVER stops the instance and prevents further instance charges | string | `ALWAYS` | no |
| authorized_gae_applications_master | A list of Google App Engine (GAE) project names that are allowed to access this master instance | list | `<list>` | no |
| authorized_gae_applications_replica | A list of Google App Engine (GAE) project names that are allowed to access this replica instance | list | `<list>` | no |


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