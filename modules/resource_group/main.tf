resource "azurerm_resource_group" "resource_group" {
  count    = length(var.rg_name)
  name     = var.rg_name[count.index]
  location = var.location
  tags = merge(
    var.common_tags,
    {
      Name    = var.rg_name[count.index]
      Purpose = "A container that holds all the related resources for an Azure solution."
    }
  )
}