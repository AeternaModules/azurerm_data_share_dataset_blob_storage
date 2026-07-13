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
  validation {
    condition = alltrue([
      for k, v in var.data_share_dataset_blob_storages : (
        length(v.storage_account.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_dataset_blob_storages : (
        !endswith(v.storage_account.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_dataset_blob_storages : (
        length(v.storage_account.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_dataset_blob_storages : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.storage_account.subscription_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_dataset_blob_storages : (
        v.file_path == null || (length(v.file_path) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_share_dataset_blob_storages : (
        v.folder_path == null || (length(v.folder_path) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

