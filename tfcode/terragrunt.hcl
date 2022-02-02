remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "jenkinsstrrg"
        storage_account_name = "jenkinsstoretfstate"
        container_name = "tfstate"
    }
}

