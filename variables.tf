variable "create_cloudcheckr_role" {
  description = "(Required) Whether to create a IngraMicro iam role."
  type        = bool
  default     = true
}

variable "cloudcheckr_role_name" {
  description = "(Required) CloudCheckr iam role name."
  type        = string
  default     = "CloudCheckr"
}

variable "cloudcheckr_trusted_role_arns" {
  description = "(Required) CloudCheckr ARNs of AWS entities who can assume these roles"
  type        = list(string)
}

variable "cloudcheckr_role_sts_externalid" {
  description = "(Required) CloudCheckr STS ExternalId condition values to use with a role (when MFA is not required)"
  type        = list(string)
  default     = []
}

variable "create_ingrammicro_role" {
  description = "(Required) Whether to create a IngraMicro iam role."
  type        = bool
  default     = false
}

variable "ingrammicro_payer_account" {
  description = "(Optional) IngramMicro payer account id"
  type        = number
  default     = 111111111111
}

variable "create_cur_report" {
  description = "(Required) Whether to create bucket s3 and Cost and Usage report."
  type        = bool
  default     = false
}

variable "cur_report_name" {
  description = "(Required) Unique name for the report. Must start with a number/letter and is case sensitive. Limited to 256 characters."
  type        = string
  default     = "cost-and-usage"
}

variable "cur_report_bucket_name" {
  description = "(Required) Report bucket name."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to add to resources"
  type        = map(string)
  default     = {}
}
