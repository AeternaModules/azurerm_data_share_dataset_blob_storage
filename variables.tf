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
  # --- Unconfirmed validation candidates, derived from azurerm_data_share_dataset_blob_storage's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.DataSetName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: data_share_id
  #   source:    [from share.ValidateShareID] !ok
  # path: data_share_id
  #   source:    [from share.ValidateShareID] err != nil
  # path: container_name
  #   source:    [from storageValidate.StorageContainerName] !regexp.MustCompile(`^\$root$|^\$web$|^[0-9a-z-]+$`).MatchString(value)
  # path: container_name
  #   source:    [from storageValidate.StorageContainerName] len(value) < 3 || len(value) > 63
  # path: container_name
  #   source:    [from storageValidate.StorageContainerName] regexp.MustCompile(`^-`).MatchString(value)
  # path: storage_account.name
  #   source:    [from storageValidate.StorageAccountName] !regexp.MustCompile(`\A([a-z0-9]{3,24})\z`).MatchString(input)
  # path: storage_account.resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: storage_account.resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: storage_account.resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: storage_account.resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: storage_account.subscription_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: file_path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: folder_path
  #   condition: length(value) > 0
  #   message:   must not be empty
}

