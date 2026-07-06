output "data_share_dataset_blob_storages" {
  description = "All data_share_dataset_blob_storage resources"
  value       = azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages
}
output "data_share_dataset_blob_storages_container_name" {
  description = "List of container_name values across all data_share_dataset_blob_storages"
  value       = [for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : v.container_name]
}
output "data_share_dataset_blob_storages_data_share_id" {
  description = "List of data_share_id values across all data_share_dataset_blob_storages"
  value       = [for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : v.data_share_id]
}
output "data_share_dataset_blob_storages_display_name" {
  description = "List of display_name values across all data_share_dataset_blob_storages"
  value       = [for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : v.display_name]
}
output "data_share_dataset_blob_storages_file_path" {
  description = "List of file_path values across all data_share_dataset_blob_storages"
  value       = [for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : v.file_path]
}
output "data_share_dataset_blob_storages_folder_path" {
  description = "List of folder_path values across all data_share_dataset_blob_storages"
  value       = [for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : v.folder_path]
}
output "data_share_dataset_blob_storages_name" {
  description = "List of name values across all data_share_dataset_blob_storages"
  value       = [for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : v.name]
}
output "data_share_dataset_blob_storages_storage_account" {
  description = "List of storage_account values across all data_share_dataset_blob_storages"
  value       = [for k, v in azurerm_data_share_dataset_blob_storage.data_share_dataset_blob_storages : v.storage_account]
}

