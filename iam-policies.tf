# CloudCheckr-CloudWatchFlowLogs
resource "aws_iam_policy" "cloudwatchflowlogs" {
  count       = var.create_cloudcheckr_role == true ? 1 : 0
  name        = "CloudCheckr-CloudWatchFlowLogs"
  path        = "/"
  description = "CloudCheckr-CloudWatchFlowLogs"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:GetLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ],
      "Effect": "Allow",
      "Sid": "CloudWatchLogsSpecific"
    }
  ]
}
EOF
}

# CloudCheckr-Security
resource "aws_iam_policy" "security" {
  count       = var.create_cloudcheckr_role == true ? 1 : 0
  name        = "CloudCheckr-Security"
  path        = "/"
  description = "CloudCheckr-Security"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "acm:DescribeCertificate",
        "acm:ListCertificates",
        "acm:GetCertificate",
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetTrailStatus",
        "logs:GetLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "config:DescribeConfigRules",
        "config:GetComplianceDetailsByConfigRule",
        "config:DescribeDeliveryChannels",
        "config:DescribeDeliveryChannelStatus",
        "config:DescribeConfigurationRecorders",
        "config:DescribeConfigurationRecorderStatus",
        "ec2:Describe*",
        "iam:Get*",
        "iam:List*",
        "iam:GenerateCredentialReport",
        "kms:DescribeKey",
        "kms:GetKeyPolicy",
        "kms:GetKeyRotationStatus",
        "kms:ListAliases",
        "kms:ListGrants",
        "kms:ListKeys",
        "kms:ListKeyPolicies",
        "kms:ListResourceTags",
        "rds:Describe*",
        "ses:ListIdentities",
        "ses:GetSendStatistics",
        "ses:GetIdentityDkimAttributes",
        "ses:GetIdentityVerificationAttributes",
        "ses:GetSendQuota",
        "sns:GetTopicAttributes",
        "sns:GetSubscriptionAttributes",
        "sns:ListTopics",
        "sns:ListSubscriptionsByTopic",
        "sqs:ListQueues",
        "sqs:GetQueueAttributes"
      ],
      "Resource": "*",
      "Effect": "Allow",
      "Sid": "SecurityPermissons"
    }
  ]
}
EOF
}

# CloudCheckr-Inventory
resource "aws_iam_policy" "inventory" {
  count = var.create_cloudcheckr_role == true ? 1 : 0

  name        = "CloudCheckr-Inventory"
  path        = "/"
  description = "CloudCheckr-Inventory"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "acm:DescribeCertificate",
        "acm:ListCertificates",
        "acm:GetCertificate",
        "ec2:Describe*",
        "ec2:GetConsoleOutput",
        "autoscaling:Describe*",
        "cloudformation:DescribeStacks",
        "cloudformation:GetStackPolicy",
        "cloudformation:GetTemplate",
        "cloudformation:ListStackResources",
        "cloudfront:List*",
        "cloudfront:GetDistributionConfig",
        "cloudfront:GetStreamingDistributionConfig",
        "cloudhsm:Describe*",
        "cloudhsm:List*",
        "cloudsearch:Describe*",
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetTrailStatus",
        "cloudwatch:DescribeAlarms",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:ListMetrics",
        "cognito-identity:ListIdentities",
        "cognito-identity:ListIdentityPools",
        "cognito-idp:ListGroups",
        "cognito-idp:ListIdentityProviders",
        "cognito-idp:ListUserPools",
        "cognito-idp:ListUsers",
        "cognito-idp:ListUsersInGroup",
        "config:DescribeConfigRules",
        "config:GetComplianceDetailsByConfigRule",
        "config:Describe*",
        "datapipeline:ListPipelines",
        "datapipeline:GetPipelineDefinition",
        "datapipeline:DescribePipelines",
        "directconnect:DescribeLocations",
        "directconnect:DescribeConnections",
        "directconnect:DescribeVirtualInterfaces",
        "dynamodb:ListTables",
        "dynamodb:DescribeTable",
        "dynamodb:ListTagsOfResource",
        "ecs:ListClusters",
        "ecs:DescribeClusters",
        "ecs:ListContainerInstances",
        "ecs:DescribeContainerInstances",
        "ecs:ListServices",
        "ecs:DescribeServices",
        "ecs:ListTaskDefinitions",
        "ecs:DescribeTaskDefinition",
        "ecs:ListTasks",
        "ecs:DescribeTasks",
        "ssm:ListResourceDataSync",
        "ssm:ListAssociations",
        "ssm:ListDocumentVersions",
        "ssm:ListDocuments",
        "ssm:ListInstanceAssociations",
        "ssm:ListInventoryEntries",
        "elasticache:Describe*",
        "elasticache:List*",
        "elasticbeanstalk:Describe*",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeTags",
        "elasticloadbalancing:Describe*",
        "elasticmapreduce:Describe*",
        "elasticmapreduce:List*",
        "es:ListDomainNames",
        "es:DescribeElasticsearchDomains",
        "glacier:ListTagsForVault",
        "glacier:DescribeVault",
        "glacier:GetVaultNotifications",
        "glacier:DescribeJob",
        "glacier:GetJobOutput",
        "glacier:ListJobs",
        "glacier:ListVaults",
        "iam:Get*",
        "iam:List*",
        "iam:GenerateCredentialReport",
        "iot:DescribeThing",
        "iot:ListThings",
        "kms:DescribeKey",
        "kms:GetKeyPolicy",
        "kms:GetKeyRotationStatus",
        "kms:ListAliases",
        "kms:ListGrants",
        "kms:ListKeys",
        "kms:ListKeyPolicies",
        "kms:ListResourceTags",
        "kinesis:ListStreams",
        "kinesis:DescribeStream",
        "kinesis:GetShardIterator",
        "lambda:ListFunctions",
        "lambda:ListTags",
        "Organizations:List*",
        "Organizations:Describe*",
        "rds:Describe*",
        "rds:List*",
        "redshift:Describe*",
        "route53:ListHealthChecks",
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets",
        "s3:GetBucketACL",
        "s3:GetBucketLocation",
        "s3:GetBucketLogging",
        "s3:GetBucketPolicy",
        "s3:GetBucketTagging",
        "s3:GetBucketWebsite",
        "s3:GetBucketNotification",
        "s3:GetLifecycleConfiguration",
        "s3:List*",
        "sdb:ListDomains",
        "sdb:DomainMetadata",
        "ses:ListIdentities",
        "ses:GetSendStatistics",
        "ses:GetIdentityDkimAttributes",
        "ses:GetIdentityVerificationAttributes",
        "ses:GetSendQuota",
        "sns:GetTopicAttributes",
        "sns:GetSubscriptionAttributes",
        "sns:ListTopics",
        "sns:ListSubscriptionsByTopic",
        "sqs:ListQueues",
        "sqs:GetQueueAttributes",
        "storagegateway:Describe*",
        "storagegateway:List*",
        "support:*",
        "swf:ListClosedWorkflowExecutions",
        "swf:ListDomains",
        "swf:ListActivityTypes",
        "swf:ListWorkflowTypes",
        "wellarchitected:List*",
        "wellarchitected:Get*",
        "workspaces:DescribeWorkspaceDirectories",
        "workspaces:DescribeWorkspaceBundles",
        "workspaces:DescribeWorkspaces"
      ],
      "Resource": "*",
      "Effect": "Allow",
      "Sid": "InventoryAndUtilization"
    }
  ]
}
EOF
}

# CloudCheckr-DBR
#resource "aws_iam_policy" "dbr" {
#  name        = "CloudCheckr-DBR"
#  path        = "/"
#  description = "CloudCheckr-DBR"
#  policy      = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": [
#        "s3:GetBucketACL",
#        "s3:GetBucketLocation",
#        "s3:GetBucketLogging",
#        "s3:GetBucketPolicy",
#        "s3:GetBucketTagging",
#        "s3:GetBucketWebsite",
#        "s3:GetBucketNotification",
#        "s3:GetLifecycleConfiguration",
#        "s3:GetObject"
#      ],
#      "Resource": [
#        "Resource":[
#          "arn:aws:s3:::${aws_s3_bucket.billing_bucket.bucket}",
#          "arn:aws:s3:::${aws_s3_bucket.billing_bucket.bucket}/*"
#      ],
#      "Effect": "Allow",
#      "Sid": "CostReadDBR"
#    }
#  ]
#}
#EOF
#}


# CloudCheckr-CUR
resource "aws_iam_policy" "cur" {
  count       = var.create_cloudcheckr_role && var.create_cur_report == true ? 1 : 0
  name        = "CloudCheckr-CUR"
  path        = "/"
  description = "CloudCheckr-CUR"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "${aws_s3_bucket.cur[0].arn}",
        "${aws_s3_bucket.cur[0].arn}/*"
      ],
      "Effect": "Allow",
      "Sid": "CostReadCUR"
    }
  ]
}
EOF
}

# CloudCheckr-Cost
resource "aws_iam_policy" "cost" {
  count       = var.create_cloudcheckr_role == true ? 1 : 0
  name        = "CloudCheckr-Cost"
  path        = "/"
  description = "CloudCheckr-Cost"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ce:GetReservationUtilization",
        "ec2:DescribeAccountAttributes",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeReservedInstancesOfferings",
        "ec2:DescribeReservedInstances",
        "ec2:DescribeReservedInstancesListings",
        "ec2:DescribeHostReservationOfferings",
        "ec2:DescribeReservedInstancesModifications",
        "ec2:DescribeHostReservations",
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceStatus",
        "ec2:DescribeRegions",
        "ec2:DescribeKeyPairs",
        "ec2:DescribePlacementGroups",
        "ec2:DescribeAddresses",
        "ec2:DescribeSpotInstanceRequests",
        "ec2:DescribeImages",
        "ec2:DescribeImageAttribute",
        "ec2:DescribeSnapshots",
        "ec2:DescribeVolumes",
        "ec2:DescribeTags",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeInstanceAttribute",
        "ec2:DescribeVolumeStatus",
        "elasticache:DescribeReservedCacheNodes",
        "elasticache:DescribeReservedCacheNodesOfferings",
        "rds:DescribeReservedDBInstances",
        "rds:DescribeReservedDBInstancesOfferings",
        "rds:DescribeDBInstances",
        "redshift:DescribeReservedNodes",
        "redshift:DescribeReservedNodeOfferings",
        "s3:GetBucketACL",
        "s3:GetBucketLocation",
        "s3:GetBucketLogging",
        "s3:GetBucketPolicy",
        "s3:GetBucketTagging",
        "s3:GetBucketWebsite",
        "s3:GetBucketNotification",
        "s3:GetLifecycleConfiguration",
        "s3:List*",
        "dynamodb:DescribeReservedCapacity",
        "dynamodb:DescribeReservedCapacityOfferings",
        "iam:GetAccountAuthorizationDetails",
        "iam:ListRolePolicies",
        "iam:ListAttachedRolePolicies",
        "savingsplans:DescribeSavingsPlans"
      ],
      "Resource": "*",
      "Effect": "Allow",
      "Sid": "CloudCheckrCostPermissions"
    }
  ]
}
EOF
}

# IMBillingRole
resource "aws_iam_policy" "immasterbilling" {
  count       = var.create_ingrammicro_role == true ? 1 : 0
  name        = "IMMasterBilling"
  path        = "/"
  description = "Policy for IM Billing Access"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action":[
        "aws-portal:*Usage",
        "aws-portal:*PaymentMethods",
        "aws-portal:*",
        "cur:*",
        "budgets:*",
        "aws-portal:*Billing"
      ],
      "Resource": ["*"]
    },
    {
      "Sid": "VisualEditor1",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": "${aws_s3_bucket.cur[0].arn}/*"
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "imbillingrole" {
  count = var.create_cloudcheckr_role == true ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.ingrammicro_payer_account]
    }
  }
}

data "aws_iam_policy_document" "cloudcheckr" {
  count = var.create_cloudcheckr_role == true ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.cloudcheckr_trusted_role_arns
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = var.cloudcheckr_role_sts_externalid
    }
  }
}
