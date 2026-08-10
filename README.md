# terraform-aws-cloudcheckr

Terraform module that provisions the CloudCheckr IAM roles and policies, the
Ingram Micro billing role, and an optional AWS Cost and Usage Report bucket.

## Compatibility

This module requires Terraform 1.6.0 or later and supports AWS provider
versions from 5.40.0 up to, but not including, 7.0.0.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.40.0, < 7.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.40.0, < 7.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cur_report_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cur_report_definition) | resource |
| [aws_iam_policy.cloudwatchflowlogs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cost](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cur](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.immasterbilling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.inventory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.security](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cloudcheckr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.imbillingrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudcheckr-cloudwatchflowlogs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudcheckr-cost](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudcheckr-cur](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudcheckr-inventory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudcheckr-security](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.imbillingrole-awssupportaccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.imbillingrole-iammasterbilling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.imbillingrole-readonlyaccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.imbillingrole-savingplansfullaccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.cur](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.cur](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.cur](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_iam_policy_document.cloudcheckr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.imbillingrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudcheckr_role_name"></a> [cloudcheckr\_role\_name](#input\_cloudcheckr\_role\_name) | (Required) CloudCheckr iam role name. | `string` | `"CloudCheckr"` | no |
| <a name="input_cloudcheckr_role_sts_externalid"></a> [cloudcheckr\_role\_sts\_externalid](#input\_cloudcheckr\_role\_sts\_externalid) | (Required) CloudCheckr STS ExternalId condition values to use with a role (when MFA is not required) | `list(string)` | `[]` | no |
| <a name="input_cloudcheckr_trusted_role_arns"></a> [cloudcheckr\_trusted\_role\_arns](#input\_cloudcheckr\_trusted\_role\_arns) | (Required) CloudCheckr ARNs of AWS entities who can assume these roles | `list(string)` | n/a | yes |
| <a name="input_create_cloudcheckr_role"></a> [create\_cloudcheckr\_role](#input\_create\_cloudcheckr\_role) | (Required) Whether to create a IngraMicro iam role. | `bool` | `true` | no |
| <a name="input_create_cur_report"></a> [create\_cur\_report](#input\_create\_cur\_report) | (Required) Whether to create bucket s3 and Cost and Usage report. | `bool` | `false` | no |
| <a name="input_create_ingrammicro_role"></a> [create\_ingrammicro\_role](#input\_create\_ingrammicro\_role) | (Required) Whether to create a IngraMicro iam role. | `bool` | `false` | no |
| <a name="input_cur_report_bucket_name"></a> [cur\_report\_bucket\_name](#input\_cur\_report\_bucket\_name) | (Required) Report bucket name. | `string` | `null` | no |
| <a name="input_cur_report_name"></a> [cur\_report\_name](#input\_cur\_report\_name) | (Required) Unique name for the report. Must start with a number/letter and is case sensitive. Limited to 256 characters. | `string` | `"cost-and-usage"` | no |
| <a name="input_ingrammicro_payer_account"></a> [ingrammicro\_payer\_account](#input\_ingrammicro\_payer\_account) | (Optional) IngramMicro payer account id | `number` | `111111111111` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to resources | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Example

See [`examples/complete`](examples/complete).
