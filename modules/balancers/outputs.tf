output "load_balancer" {
  value = azurerm_lb.vmss_load_balancer
}

output "lb_backend_address_pool" {
  value = azurerm_lb_backend_address_pool.backend_address_pool
}

output "lb_probe" {
  value = azurerm_lb_probe.vmss_probe
}

output "nat_rule" {
  value = azurerm_lb_rule.lbnatrule
}