#Role
locals {
  role_sts_externalid = flatten([var.role_sts_externalid])
}

data "aws_iam_policy_document" "assume_role" {

  statement {
    effect = "Allow"

    actions = var.trusted_role_actions

    principals {
      type        = "AWS"
      identifiers = var.trusted_role_arns
    }

    principals {
      type        = "Service"
      identifiers = var.trusted_role_services
    }

    dynamic "condition" {
      for_each = length(local.role_sts_externalid) != 0 ? [true] : []
      content {
        test     = "StringEquals"
        variable = "sts:ExternalId"
        values   = local.role_sts_externalid
      }
    }
  }
}

resource "aws_iam_role" "this" {
  name                 = var.role_name
  path                 = var.role_path
  max_session_duration = var.max_session_duration
  description          = var.role_description

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "custom" {
  for_each   = toset(["CloudCheckr-CloudTrail-Policy", "CloudCheckr-CloudWatchFlowLogs-Policy", "CloudCheckr-Security-Policy", "CloudCheckr-Inventory-Policy", "CloudCheckr-DBR-Policy", "CloudCheckr-CUR-Policy", "CloudCheckr-Cost-Policy"])
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::${local.account_id}:policy/${each.key}"
}

resource "aws_iam_instance_profile" "this" {
  name = var.role_name
  path = var.role_path
  role = aws_iam_role.this.name

  tags = var.tags
}
