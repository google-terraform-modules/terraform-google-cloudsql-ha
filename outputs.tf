###############################
##          MASTER           ##
###############################
output "master_instance_sql_ipv4" {
  value       = "${google_sql_database_instance.new_instance_sql_master.ip_address.0.ip_address}"
  description = "The IPv4 address assigned for master"
}

output "master_instance_sql_ipv4_time_to_retire" {
  value       = "${google_sql_database_instance.new_instance_sql_master.ip_address.0.time_to_retire}"
  description = "The time this IP address will be retired, in RFC 3339 format"
}

output "master_users_self_link" {
  value       = "${google_sql_database_instance.new_instance_sql_master.self_link}"
  description = "The URL of the created resource"
}

output "master_server_ca_cert" {
  value       = "${google_sql_database_instance.new_instance_sql_master.server_ca_cert.0.cert}"
  description = "The CA Certificate used to connect to the SQL Instance via SSL"
}

output "master_server_ca_cert_common_name" {
  value       = "${google_sql_database_instance.new_instance_sql_master.server_ca_cert.0.common_name}"
  description = "The CN valid for the CA Cert"
}

output "master_server_ca_cert_create_time" {
  value       = "${google_sql_database_instance.new_instance_sql_master.server_ca_cert.0.create_time}"
  description = "Creation time of the CA Cert"
}

output "master_server_ca_cert_expiration_time" {
  value       = "${google_sql_database_instance.new_instance_sql_master.server_ca_cert.0.expiration_time}"
  description = "Expiration time of the CA Cert"
}

output "master_server_ca_cert_sha1_fingerprint" {
  value       = "${google_sql_database_instance.new_instance_sql_master.server_ca_cert.0.sha1_fingerprint}"
  description = "SHA Fingerprint of the CA Cert"
}

###############################
##          REPLICA          ##
###############################
output "replica_instance_sql_ipv4" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.ip_address.0.ip_address}"
  description = "The IPv4 address assigned for replica"
}

output "replica_instance_sql_ipv4_time_to_retire" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.ip_address.0.time_to_retire}"
  description = "The time this IP address will be retired, in RFC 3339 format"
}

output "replica_users_self_link" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.self_link}"
  description = "The URL of the created resource"
}

output "replica_server_ca_cert" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.server_ca_cert.0.cert}"
  description = "The CA Certificate used to connect to the SQL Instance via SSL"
}

output "replica_server_ca_cert_common_name" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.server_ca_cert.0.common_name}"
  description = "The CN valid for the CA Cert"
}

output "replica_server_ca_cert_create_time" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.server_ca_cert.0.create_time}"
  description = "Creation time of the CA Cert"
}

output "replica_server_ca_cert_expiration_time" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.server_ca_cert.0.expiration_time}"
  description = "Expiration time of the CA Cert"
}

output "replica_server_ca_cert_sha1_fingerprint" {
  value       = "${google_sql_database_instance.new_instance_sql_replica.server_ca_cert.0.sha1_fingerprint}"
  description = "SHA Fingerprint of the CA Cert"
}
