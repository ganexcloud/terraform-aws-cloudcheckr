module "cloudcheckr" {
  source = "../../"

  cloudcheckr_trusted_role_arns   = ["arn:aws:iam::111111111111:root"]
  cloudcheckr_role_sts_externalid = ["example-external-id"]
  create_ingrammicro_role         = true
  ingrammicro_payer_account       = 111111111111
  create_cur_report               = true
  cur_report_bucket_name          = "cloudcheckr-cur-example"
  tags = {
    Example = "complete"
  }
}
