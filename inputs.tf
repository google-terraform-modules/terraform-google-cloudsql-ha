variable "name" {
    type = "string"
    description = "Name of the SQL instance"
}

variable "region" {
    type = "string"
    default = "europe-west1"
    description = "Region of the Instance"
}

variable "zone_master" {
    type = "string"
    description = "Area of the instance (a, b, c, d, e)"
}

variable "zone_replica" {
    type = "string"
    description = "Area of the instance (a, b, c, d, e)"
}

variable "database_version" {
    type = "string"
    default = "MYSQL_5_7"
    description = "Version of the database (MYSQL_5_6, MYSQL_5_7, POSTGRES_9_6)"
}

variable "instance_size_master" {
    type = "string"
    default = "db-f1-micro"
    description = "size of instance (ex: db-f1-micro)"
}

variable "instance_size_replica" {
    type = "string"
    default = "db-f1-micro"
    description = "size of instance (ex: db-f1-micro)"
}

variable "disk_type_master" {
    type = "string"
    default = "PD_SSD"
    description = "Storage Type (SSD ..)"
}

variable "disk_type_replica" {
    type = "string"
    default = "PD_SSD"
    description = "Storage Type (SSD ..)"
}

variable "disk_size" {
    type = "string"
    default = 10
    description = "Storage size in GB"
}

variable "disk_autoresize" {
    type = "string"
    default = true
    description = "Auto-resize of the disk if the starting size is exceeded"
}

variable "cidr_ip_access" {
    type = "string"
    default = "0.0.0.0/0"
    description = "A CIDR notation IPv4 or IPv6 address that is allowed to access this instance"
}


// MySQL - backup & maintenance

variable "maintenance_window_day_master" {
    type = "string"
    default = 7
    description = "Day of maintenance (integer)"
}

variable "maintenance_window_day_replica" {
    type = "string"
    default = 3
    description = "Day of maintenance (integer)"
}

variable "maintenance_window_hour_master" {
    type = "string"
    default = 4
    description = "Hour of maintenance (integer)"
}

variable "maintenance_window_hour_replica" {
    type = "string"
    default = 4
    description = "Hour of maintenance (integer)"
}

variable "backup_enabled" {
    type = "string"
    default = false
    description = "Backup activation"
}

variable "backup_start_time" {
    type = "string"
    default = "02:30"
    description = "Start time of the daily backup"
}


// MySQL User

variable "hostname" {
    type = "string"
    default = "%"
    description = "Hostname for accessing the database"
}

variable "username" {
    type = "string"
    default = "admin"
    description = "Username of the host to access the database"
}

variable "password" {
    type = "string"
    description = "Password of the host to access the database"
}