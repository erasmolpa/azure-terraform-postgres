provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
locals {
    create_public_access =  var.public_network_access_enabled
}

module "postgresql" {
  source = "Azure/postgresql/azurerm"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_name                   = var.server_name
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  auto_grow_enabled             = var.auto_grow_enabled
  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  administrator_login           = var.administrator_login
  administrator_password        = var.administrator_password
  server_version                = var.server_version
  ssl_enforcement_enabled       = var.ssl_enforcement_enabled
  public_network_access_enabled = local.create_public_access ? true : false
  db_names                      = var.db_names
  db_charset                    = var.db_charset
  db_collation                  = var.db_collation

  firewall_rule_prefix = local.create_public_access ? var.firewall_rule_prefix : null
  firewall_rules = local.create_public_access ? var.firewall_rules : []

  vnet_rule_name_prefix = local.create_public_access ? var.vnet_rule_name_prefix : null
  vnet_rules = local.create_public_access ? var.vnet_rules : []

  tags = var.tags

  postgresql_configurations = var.postgresql_configurations
}
