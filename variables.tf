##############################
###         GENERAL        ###
##############################

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
  default     = "dev"
  description = "Environment"
}

variable "zone_master" {
  type        = "string"
  description = "Area of the instance master (a, b, c, d, e)"
}

variable "zone_replica" {
  type        = "string"
  description = "Area of the instance replica (a, b, c, d, e)"
}

variable "database_version" {
  type        = "string"
  default     = "MYSQL_5_7"
  description = "he MySQL version to use. Can be MYSQL_5_6, MYSQL_5_7 or POSTGRES_9_6 for second-generation instances, or MYSQL_5_5 or MYSQL_5_6 for first-generation instances. See Second Generation Capabilities for more information. POSTGRES_9_6 support is in Beta"
}

variable "instance_size_master" {
  type        = "string"
  default     = "db-f1-micro"
  description = "size of instance master (ex: db-f1-micro)"
}

variable "instance_size_replica" {
  type        = "string"
  default     = "db-f1-micro"
  description = "size of instance replica (ex: db-f1-micro)"
}

variable "disk_type_master" {
  type        = "string"
  default     = "PD_SSD"
  description = "The type of data disk for master: PD_SSD or PD_HDD"
}

variable "disk_type_replica" {
  type        = "string"
  default     = "PD_SSD"
  description = "The type of data disk for replica: PD_SSD or PD_HDD"
}

variable "disk_size" {
  type        = "string"
  default     = "10"
  description = "The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased"
}

variable "disk_autoresize" {
  type        = "string"
  default     = true
  description = "Configuration to increase storage size automatically"
}

variable "activation_policy" {
  type        = "string"
  default     = "ALWAYS"
  description = "For Second Generation instances, the activation policy is used only to start or stop the instance. Setting the activation policy to ALWAYS starts the instance, and setting it to NEVER stops the instance and prevents further instance charges"
}

variable "cidr_ip_access" {
  type        = "string"
  default     = "0.0.0.0/0"
  description = "A CIDR notation IPv4 or IPv6 address that is allowed to access this instance"
}

variable "require_ssl" {
  type        = "string"
  default     = false
  description = "True if mysqld should default to REQUIRE X509 for users connecting over IP"
}

variable "ipv4_enabled" {
  type        = "string"
  default     = true
  description = "True if the instance should be assigned an IP address. The IPv4 address cannot be disabled for Second Generation instances"
}

variable "connect_retry_interval" {
  type        = "string"
  default     = "60"
  description = "The number of seconds between connect retries"
}

##############################
###  MAINTENANCE - BACKUP  ###
##############################

variable "maintenance_window_day_master" {
  type        = "string"
  default     = "7"
  description = "Day of week (1-7), starting on Monday"
}

variable "maintenance_window_hour_master" {
  type        = "string"
  default     = "4"
  description = "Hour of day (0-23), ignored if day not set"
}

variable "maintenance_window_day_replica" {
  type        = "string"
  default     = "3"
  description = "Day of week (1-7), starting on Monday"
}

variable "maintenance_window_hour_replica" {
  type        = "string"
  default     = "4"
  description = "Hour of day (0-23), ignored if day not set"
}

variable "maintenance_update_track" {
  type        = "string"
  default     = "stable"
  description = "Receive updates earlier (canary) or later (stable)"
}

variable "backup_enabled" {
  type        = "string"
  default     = true
  description = "True if backup configuration is enabled"
}

variable "backup_start_time" {
  type        = "string"
  default     = "02:30"
  description = "HH:MM format time indicating when backup configuration starts."
}

##########################
###    AUTORIZATIONS   ###
##########################

variable "authorized_gae_applications_master" {
  type        = "list"
  default     = []
  description = "A list of Google App Engine (GAE) project names that are allowed to access this master instance"
}

variable "authorized_gae_applications_replica" {
  type        = "list"
  default     = []
  description = "A list of Google App Engine (GAE) project names that are allowed to access this replica instance"
}
