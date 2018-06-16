# For more details please see the following pages :
# https://www.terraform.io/docs/providers/google/r/sql_database_instance.html

##############################
###        CLOUDSQL        ###
##############################

# name (mandatory)
# env (mandatory)
# region (mandatory)
# db_version (default: MYSQL_5_7)
# backup_enabled (default: true)
# backup_time (default: 02:30)
variable "general" {
  type        = "map"
  description = "General configuration"
}

# tier (default: db-f1-micro)
# zone (mandatory)
# disk_type (default: PD_SSD)
# disk_size (default: 10)
# disk_auto (default: true)
# activation_policy (default: ALWAYS)
# require_ssl (default: false)
# ipv4_enabled (default: true)
# maintenance_day (default: 1)
# maintenance_hour (default: 2)
# maintenance_track (default: stable)
variable "master" {
  type        = "map"
  description = "Master configuration"
}

# tier (default: db-f1-micro)
# zone (mandatory)
# disk_type (default: PD_SSD)
# disk_size (default: 10)
# disk_auto (default: true)
# activation_policy (default: ALWAYS)
# retry_interval (default: 60) => disabled
# maintenance_day (default: 3)
# maintenance_hour (default: 2)
# maintenance_track (default: stable)
variable "replica" {
  type        = "map"
  description = "Replica configuration"
}

variable "labels" {
  type        = "map"
  default     = {}
  description = "Global labels"
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
