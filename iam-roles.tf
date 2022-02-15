# Cloudcheckr
resource "aws_iam_role" "cloudcheckr" {
  count              = var.create_cloudcheckr_role == true ? 1 : 0
  name               = var.cloudcheckr_role_name
  path               = "/"
  description        = "Cloudcheckr IAM Role"
  assume_role_policy = data.aws_iam_policy_document.cloudcheckr[0].json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "cloudcheckr-cloudwatchflowlogs" {
  count      = var.create_cloudcheckr_role == true ? 1 : 0
  role       = aws_iam_role.cloudcheckr[0].name
  policy_arn = aws_iam_policy.cloudwatchflowlogs[0].arn
}

resource "aws_iam_role_policy_attachment" "cloudcheckr-security" {
  count      = var.create_cloudcheckr_role == true ? 1 : 0
  role       = aws_iam_role.cloudcheckr[0].name
  policy_arn = aws_iam_policy.security[0].arn
}


resource "aws_iam_role_policy_attachment" "cloudcheckr-inventory" {
  count      = var.create_cloudcheckr_role == true ? 1 : 0
  role       = aws_iam_role.cloudcheckr[0].name
  policy_arn = aws_iam_policy.inventory[0].arn
}


resource "aws_iam_role_policy_attachment" "cloudcheckr-cur" {
  count      = var.create_cloudcheckr_role && var.create_cur_report == true ? 1 : 0
  role       = aws_iam_role.cloudcheckr[0].name
  policy_arn = aws_iam_policy.cur[0].arn
}

resource "aws_iam_role_policy_attachment" "cloudcheckr-cost" {
  count      = var.create_cloudcheckr_role == true ? 1 : 0
  role       = aws_iam_role.cloudcheckr[0].name
  policy_arn = aws_iam_policy.cost[0].arn
}

# IMBillingRole
resource "aws_iam_role" "imbillingrole" {
  count              = var.create_ingrammicro_role == true ? 1 : 0
  name               = "IMBillingRole"
  description        = "Cross Account Billing Access from IM Payer"
  assume_role_policy = data.aws_iam_policy_document.imbillingrole.json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "imbillingrole-iammasterbilling" {
  count      = var.create_ingrammicro_role == true ? 1 : 0
  role       = aws_iam_role.imbillingrole[0].name
  policy_arn = aws_iam_policy.immasterbilling[0].arn
}

resource "aws_iam_role_policy_attachment" "imbillingrole-awssupportaccess" {
  count      = var.create_ingrammicro_role == true ? 1 : 0
  role       = aws_iam_role.imbillingrole[0].name
  policy_arn = "arn:aws:iam::aws:policy/AWSSupportAccess"
}

resource "aws_iam_role_policy_attachment" "imbillingrole-readonlyaccess" {
  count      = var.create_ingrammicro_role == true ? 1 : 0
  role       = aws_iam_role.imbillingrole[0].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "imbillingrole-savingplansfullaccess" {
  count      = var.create_ingrammicro_role == true ? 1 : 0
  role       = aws_iam_role.imbillingrole[0].name
  policy_arn = "arn:aws:iam::aws:policy/SavingPlansFullAccess"
}
