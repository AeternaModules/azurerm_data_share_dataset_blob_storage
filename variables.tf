variable "data_share_dataset_blob_storages" {
  description = <<EOT
Map of data_share_dataset_blob_storages, attributes below
Required:
    - container_name
    - data_share_id
    - name
    - storage_account (block):
        - name (required)
        - resource_group_name (required)
        - subscription_id (required)
Optional:
    - file_path
    - folder_path
EOT

  type = map(object({
    container_name = string
    data_share_id  = string
    name           = string
    file_path      = optional(string)
    folder_path    = optional(string)
    storage_account = object({
      name                = string
      resource_group_name = string
      subscription_id     = string
    })
  }))
}

