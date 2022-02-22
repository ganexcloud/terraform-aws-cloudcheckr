module "cloudcheckr" {
  source                          = "git::https://gitlab.com/ganex-cloud/terraform/terraform-aws-cloudcheckr.git?ref=master"
  cloudcheckr_trusted_role_arns   = ["arn:aws:iam::xxxx:root"]
  cloudcheckr_role_sts_externalid = ["xxxxxxx", "xxxxxxxxxx"]
}
