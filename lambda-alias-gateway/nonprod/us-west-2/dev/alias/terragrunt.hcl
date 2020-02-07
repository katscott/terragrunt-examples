terraform {
  source = "../../../../modules//alias"
}

dependencies {
  paths = ["../lambda"]
}

dependency "lambda" {
  config_path = "../lambda"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  function_name = dependency.lambda.outputs.function_name
  qualifier     = dependency.lambda.outputs.version
}
