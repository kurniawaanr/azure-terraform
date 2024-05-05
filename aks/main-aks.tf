provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "default" {
  name = "aks-test"
  location = "southeastasia"
  resource_group_name = "rg-azuretf-test"
  dns_prefix = "dns-k8s-test"
  kubernetes_version = "1.27.9"

  default_node_pool {
    name = "testnodepool"
    node_count = 2
    vm_size = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id = var.clientId
    client_secret = var.clientSecret
  }

  role_based_access_control_enabled = true

  tags = {
    environtment = "test"
  }
}