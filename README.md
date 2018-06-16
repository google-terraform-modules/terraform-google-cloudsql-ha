# Google Cloud SQL Cluster (HA-RR)

Compatible provider `1.14`   
**Warning** : this module support only MySQL-RR. Google Cloud Plateform [doesn't support](https://cloud.google.com/sql/docs/postgres/replication/) **ZONAL** replication.

If you want to create a PostgreSQL HA cluster, you can use [google-terraform-modules/terraform-google-cloudsql](https://github.com/google-terraform-modules/terraform-google-cloudsql).

## Example

* europe-west1, 1 master (zone b), 1 failover-replica (zone c), db-f1-micro
```hcl
module "cloudsql-rr" {
  source = "git::ssh://git@github.com:google-terraform-modules/terraform-google-cloudsql-ha.git"

  general = {
    name       = "mydatabase"
    env        = "dev"
    region     = "europe-west1"
    db_version = "MYSQL_5_6"
  }

  master = {
    zone = "b"
  }

  replica = {
    zone = "c"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorized_gae_applications_master | A list of Google App Engine (GAE) project names that are allowed to access this master instance | list | `<list>` | no |
| authorized_gae_applications_replica | A list of Google App Engine (GAE) project names that are allowed to access this replica instance | list | `<list>` | no |
| general | General configuration | map | - | yes |
| labels | Global labels | map | `<map>` | no |
| master | Master configuration | map | - | yes |
| replica | Replica configuration | map | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| master_instance_sql_ipv4 | The IPv4 address assigned for master |
| master_instance_sql_ipv4_time_to_retire | The time this IP address will be retired, in RFC 3339 format |
| master_server_ca_cert | The CA Certificate used to connect to the SQL Instance via SSL |
| master_server_ca_cert_common_name | The CN valid for the CA Cert |
| master_server_ca_cert_create_time | Creation time of the CA Cert |
| master_server_ca_cert_expiration_time | Expiration time of the CA Cert |
| master_server_ca_cert_sha1_fingerprint | SHA Fingerprint of the CA Cert |
| master_users_self_link | The URL of the created resource |
| replica_instance_sql_ipv4 | The IPv4 address assigned for replica |
| replica_instance_sql_ipv4_time_to_retire | The time this IP address will be retired, in RFC 3339 format |
| replica_server_ca_cert | The CA Certificate used to connect to the SQL Instance via SSL |
| replica_server_ca_cert_common_name | The CN valid for the CA Cert |
| replica_server_ca_cert_create_time | Creation time of the CA Cert |
| replica_server_ca_cert_expiration_time | Expiration time of the CA Cert |
| replica_server_ca_cert_sha1_fingerprint | SHA Fingerprint of the CA Cert |
| replica_users_self_link | The URL of the created resource |