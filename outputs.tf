output "instance_sql_ipv4" {
    value = "${module.new_instance_sql_master.ip_address.0.ip_address}"
    description = "The IPv4 address assigned"
}

output "instance_sql_setting_version" {
    value = "${module.new_instance_sql_master.settings.version}"
    description = " Used to make sure changes to the settings block are atomic"
}

output "users_self_link" {
    value = "${module.new_instance_sql_master.self_link}"
    description = "The URL of the created resource"
}