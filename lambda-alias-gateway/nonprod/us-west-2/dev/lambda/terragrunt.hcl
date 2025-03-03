terraform {
  source = "../../../../modules//lambda"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  file_path = "${get_terragrunt_dir()}/../../../../function.zip"
}