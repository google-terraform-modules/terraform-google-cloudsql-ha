# MASTER
output "master_instance_sql_ipv4" {
    value = "${google_sql_database_instance.new_instance_sql_master.ip_address.0.ip_address}"
    description = "The IPv4 address assigned for master"
}

output "master_instance_sql_setting_version" {
    value = "${google_sql_database_instance.new_instance_sql_master.settings.version}"
    description = " Used to make sure changes to the settings block are atomic"
}

output "master_users_self_link" {
    value = "${google_sql_database_instance.new_instance_sql_master.self_link}"
    description = "The URL of the created resource"
}

output "master_settings_version" {
    value = "${google_sql_database_instance.new_instance_sql_master.settings.version}"
    description = "Master settings version"
}


# REPLICA
output "replica_instance_sql_ipv4" {
    value = "${google_sql_database_instance.new_instance_sql_replica.ip_address.0.ip_address}"
    description = "The IPv4 address assigned for replica"
}

output "replica_instance_sql_setting_version" {
    value = "${google_sql_database_instance.new_instance_sql_replica.settings.version}"
    description = "Used to make sure changes to the settings block are atomic"
}

output "replica_users_self_link" {
    value = "${google_sql_database_instance.new_instance_sql_replica.self_link}"
    description = "The URL of the created resource"
}

output "replica_settings_version" {
    value = "${google_sql_database_instance.new_instance_sql_replica.settings.version}"
    description = "Replica settings version"
}