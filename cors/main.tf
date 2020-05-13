

resource "azurerm_api_management" "apim" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email

  sku_name = var.sku_name

  policy {
    xml_content = <<XML
    <policies>
    <inbound>
        ${local.cors_policy_xml}
    </inbound>
    <backend>
      <forward-request />
    </backend>
    <outbound />
    <on-error />
    </policies>
XML
  }

  tags = {
    app = var.app_name
    env = var.env_name
  }

}

/*
resource "azurerm_api_management_diagnostic" "apim_diagnostic" {

  identifier          = "applicationinsights"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  enabled             = true

}
*/