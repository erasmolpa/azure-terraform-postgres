variable "resource_group_name" {
  description = "resource_group_name"
  type = string
}

variable "location" {
  description = "location"
  type = string
  default = "West Europe"
}

variable "server_name" {
  description = "server"
  type = string
}

variable "sku_name" {
  type        = string
  default     = "GP_Gen5_4"
  description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
}

variable "storage_mb" {
  description = "storage"
  type = number
  default = 5120
}

variable "auto_grow_enabled" {
  description = "Auto grow enabled for PostgreSQL"
  type        = bool
  default     = false
}

variable "backup_retention_days" {
  description = "Backup retention days for PostgreSQL"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Geo-redundant backup enabled for PostgreSQL"
  type        = bool
  default     = false
}

variable "administrator_login" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "login"
}

variable "administrator_password" {
  description = "PostgreSQL administrator password"
  type        = string
  default     = "password"
}

variable "server_version" {
  description = "PostgreSQL server version"
  type        = string
  default     = "9.5"
}

variable "ssl_enforcement_enabled" {
  description = "SSL enforcement enabled for PostgreSQL"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Public network access enabled for PostgreSQL"
  type        = bool
  default     = false
}

variable "db_names" {
  description = "List of PostgreSQL database names"
  type        = list(string)
  default     = ["my_db1", "my_db2"]
}

variable "db_charset" {
  description = "Character set for PostgreSQL databases"
  type        = string
  default     = "UTF8"
}

variable "db_collation" {
  description = "Collation for PostgreSQL databases"
  type        = string
  default     = "English_United States.1252"
}

variable "firewall_rule_prefix" {
  description = "Prefix for PostgreSQL firewall rule names"
  type        = string
  default     = "firewall-"
}

variable "firewall_rules" {
  description = "List of PostgreSQL firewall rules"
  type        = list(object({
    name     = string
    start_ip = string
    end_ip   = string
  }))
  default     = [
    { name = "test1", start_ip = "10.0.0.5", end_ip = "10.0.0.8" },
    { name = "test2", start_ip = "127.0.0.0", end_ip = "127.0.1.0" },
  ]
}

variable "vnet_rule_name_prefix" {
  description = "Prefix for PostgreSQL VNet rule names"
  type        = string
  default     = "postgresql-vnet-rule-"
}

variable "vnet_rules" {
  description = "List of PostgreSQL VNet rules"
  type        = list(object({
    name      = string
    subnet_id = string
  }))
  default     = [
    { name = "subnet1", subnet_id = "<subnet_id>" }
  ]
}

variable "tags" {
  description = "Tags for PostgreSQL resources"
  type        = map(string)
  default     = {
    Environment = "Production",
    CostCenter  = "Contoso IT",
  }
}

variable "postgresql_configurations" {
  description = "Additional PostgreSQL configurations"
  type        = map(string)
  default     = {
    backslash_quote = "on",
  }
}
