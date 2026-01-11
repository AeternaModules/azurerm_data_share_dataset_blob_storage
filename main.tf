resource "azurerm_data_share_dataset_blob_storage" "data_share_dataset_blob_storages" {
  for_each = var.data_share_dataset_blob_storages

  container_name = each.value.container_name
  data_share_id  = each.value.data_share_id
  name           = each.value.name
  file_path      = each.value.file_path
  folder_path    = each.value.folder_path

  storage_account {
    name                = each.value.storage_account.name
    resource_group_name = each.value.storage_account.resource_group_name
    subscription_id     = each.value.storage_account.subscription_id
  }
}

