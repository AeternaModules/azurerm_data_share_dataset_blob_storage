output "data_share_dataset_blob_storages_container_name" {
  description = "Map of container_name values across all data_share_dataset_blob_storages, keyed the same as var.data_share_dataset_blob_storages"
  value       = { for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : k => v.container_name }
}
output "data_share_dataset_blob_storages_data_share_id" {
  description = "Map of data_share_id values across all data_share_dataset_blob_storages, keyed the same as var.data_share_dataset_blob_storages"
  value       = { for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : k => v.data_share_id }
}
output "data_share_dataset_blob_storages_display_name" {
  description = "Map of display_name values across all data_share_dataset_blob_storages, keyed the same as var.data_share_dataset_blob_storages"
  value       = { for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : k => v.display_name }
}
output "data_share_dataset_blob_storages_file_path" {
  description = "Map of file_path values across all data_share_dataset_blob_storages, keyed the same as var.data_share_dataset_blob_storages"
  value       = { for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : k => v.file_path }
}
output "data_share_dataset_blob_storages_folder_path" {
  description = "Map of folder_path values across all data_share_dataset_blob_storages, keyed the same as var.data_share_dataset_blob_storages"
  value       = { for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : k => v.folder_path }
}
output "data_share_dataset_blob_storages_name" {
  description = "Map of name values across all data_share_dataset_blob_storages, keyed the same as var.data_share_dataset_blob_storages"
  value       = { for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : k => v.name }
}
output "data_share_dataset_blob_storages_storage_account" {
  description = "Map of storage_account values across all data_share_dataset_blob_storages, keyed the same as var.data_share_dataset_blob_storages"
  value       = { for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : k => v.storage_account }
}

