resource_group_name = "myResourceGroup"
location = "East US"
server_name = "mydbserver"
administrator_login = "myadmin"
administrator_password = "P@ssw0rd1234!"

sku_name = "B_Gen5_1"
auto_grow_enabled = true
backup_retention_days = 7
geo_redundant_backup_enabled = false
server_version = "9.5"
ssl_enforcement_enabled = false
public_network_access_enabled = false

db_names = ["my_db"]
db_charset = "UTF8"
db_collation = "English_United States.1252"

firewall_rule_prefix = "firewall-"
firewall_rules = [
  { name = "allow-ip-range", start_ip = "0.0.0.0", end_ip = "255.255.255.255" }
]

vnet_rule_name_prefix = "postgresql-vnet-rule-"
vnet_rules = []

tags = {
  Environment = "Development",
  CostCenter  = "12345",
  Owner       = "John Doe",
  Component   = "Web App",
  Team        = "DevOps",
  Category    = "Database"
}

postgresql_configurations = {
  backslash_quote = "on",
}
