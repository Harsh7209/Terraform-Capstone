locals {
  env = {
    dev = {
      instance_count = 2
      bucket_count   = 2
      table_count    = 2
    }
    stg = {
      instance_count = 3
      bucket_count   = 3
      table_count    = 3
    }
    prod = {
      instance_count = 4
      bucket_count = 4
      table_count  = 4
    }
  }
  current = lookup(local.env, terraform.workspace, local.env["dev"])
}

module "ec2" {
  source         = "./modules/ec2"
  instance_count = local.current.instance_count
  env            = terraform.workspace
}

module "s3" {
  source       = "./modules/s3"
  env          = terraform.workspace
  bucket_count = local.current.bucket_count
}

module "dynamodb" {
  source      = "./modules/dynamodb"
  env         = terraform.workspace
  table_count = local.current.table_count
}