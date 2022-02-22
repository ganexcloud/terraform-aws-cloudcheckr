module "cloudcheckr" {
  source                          = "git::https://gitlab.com/ganex-cloud/terraform/terraform-aws-cloudcheckr.git?ref=master"
  cloudcheckr_trusted_role_arns   = ["arn:aws:iam::xxxx:root"]
  cloudcheckr_role_sts_externalid = ["xxxxxxx", "xxxxxxxxxx"]
  create_ingrammicro_role         = true
  ingrammicro_payer_account       = "xxxxx"
  create_cur_report               = true
  cur_report_bucket_name          = "313-cur"
}
