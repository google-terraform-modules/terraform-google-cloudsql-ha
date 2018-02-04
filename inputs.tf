##########################
###  MASTER CLOUDSQL   ###
##########################

variable "name" {
  type        = "string"
  description = "Name of the SQL instance"
}

variable "region" {
  type        = "string"
  default     = "europe-west1"
  description = "Region of the Instance"
}

variable "env" {
  type        = "string"
  description = "Environment"
}

variable "zone_master" {
  type        = "string"
  description = "Area of the instance master (a, b, c, d, e)"
}

variable "database_version" {
  type        = "string"
  default     = "MYSQL_5_7"
  description = "Version of the database (MYSQL_5_6, MYSQL_5_7, POSTGRES_9_6)"
}

variable "instance_size_master" {
  type        = "string"
  default     = "db-f1-micro"
  description = "size of instance master (ex: db-f1-micro)"
}

variable "disk_type_master" {
  type        = "string"
  default     = "PD_SSD"
  description = "Storage type master (SSD ..)"
}

variable "disk_size" {
  type        = "string"
  default     = "10"
  description = "Storage size in GB"
}

variable "disk_autoresize" {
  type        = "string"
  default     = true
  description = "Auto-resize of the disk if the starting size is exceeded"
}

variable "cidr_ip_access" {
  type        = "string"
  default     = "0.0.0.0/0"
  description = "A CIDR notation IPv4 or IPv6 address that is allowed to access this instance"
}

variable "require_ssl" {
  type        = "string"
  default     = "false"
  description = "Connection SSL is required"
}

variable "ipv4_enabled" {
  type        = "string"
  default     = "true"
  description = "Instance should be assigned an IP address"
}

variable "connect_retry_interval" {
  type        = "string"
  default     = "60"
  description = "The number of seconds between connect retries."
}

variable "maintenance_window_day_master" {
  type        = "string"
  default     = "7"
  description = "Day of maintenance master (integer)"
}

variable "maintenance_window_hour_master" {
  type        = "string"
  default     = "4"
  description = "Hour of maintenance master (integer)"
}

variable "backup_start_time" {
  type        = "string"
  default     = "02:30"
  description = "Start time of the daily backup"
}

##########################
###  REPLICA CLOUDSQL  ###
##########################

variable "zone_replica" {
  type        = "string"
  description = "Area of the instance replica (a, b, c, d, e)"
}

variable "instance_size_replica" {
  type        = "string"
  default     = "db-f1-micro"
  description = "size of instance replica (ex: db-f1-micro)"
}

variable "disk_type_replica" {
  type        = "string"
  default     = "PD_SSD"
  description = "Storage type replica (SSD ..)"
}

variable "maintenance_window_day_replica" {
  type        = "string"
  default     = "3"
  description = "Day of maintenance replica (integer)"
}

variable "maintenance_window_hour_replica" {
  type        = "string"
  default     = "4"
  description = "Hour of maintenance replica (integer)"
}

##########################
###   USERS CLOUDSQL   ###
##########################

variable "hostname" {
  type        = "list"
  default     = ["%"]
  description = "Hostname for accessing the database"
}

variable "username" {
  type        = "list"
  default     = ["admin"]
  description = "Username of the host to access the database"
}

variable "password" {
  type        = "list"
  default     = []
  description = "Password of the host to access the database"
}
