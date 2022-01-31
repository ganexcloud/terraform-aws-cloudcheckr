module "iam_role-cloudcheckr" {
  source         = "git::https://gitlab.com/ganex-cloud/terraform/terraform-aws-cloudcheckr.git?ref=master"  
  trusted_role_arns = ["arn:aws:iam::123456789101:root"]
  role_sts_externalid = [
      "CC-1234D5D8D5EE66F47DD42DDDCGC5B3EC"
  ]
}