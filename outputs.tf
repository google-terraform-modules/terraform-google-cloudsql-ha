output "master_instance_sql_ipv4" {
    value = "${module.new_instance_sql_master.instance_sql_ipv4}"
    description = "The IPv4 address assigned"
}

output "master_instance_sql_setting_version" {
    value = "${module.new_instance_sql_master.instance_sql_setting_version}"
    description = " Used to make sure changes to the settings block are atomic"
}

output "master_users_self_link" {
    value = "${module.new_instance_sql_master.users_self_link}"
    description = "The URL of the created resource"
}

output "replica_instance_sql_ipv4" {
    value = "${google_sql_database_instance.new_instance_sql_failover.ip_address.0.ip_address}"
    description = "The IPv4 address assigned"
}

output "replica_instance_sql_setting_version" {
    value = "${google_sql_database_instance.new_instance_sql_failover.settings.version}"
    description = " Used to make sure changes to the settings block are atomic"
}

output "replica_users_self_link" {
    value = "${google_sql_database_instance.new_instance_sql_failover.self_link}"
    description = "The URL of the created resource"
}