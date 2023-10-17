resource "azurerm_lb" "vmss_load_balancer" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = module.rg.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_id
  }

  tags = var.common_tags
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.vmss_load_balancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "vmss_probe" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.vmss_load_balancer.id
  name                = "ssh-probe"
  port                = var.application_port
}

resource "azurerm_lb_rule" "lbnatrule" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.vmss_load_balancer.id
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = var.application_port
  backend_port                   = var.application_port
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_address_pool.id]
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.vmss_probe.id
}