
#Policy CloudwatchLogs
resource "aws_iam_policy" "CloudWatchFlowLogsPolicy" {
  name        = "CloudCheckr-CloudWatchFlowLogs-Policy"
  path        = "/"
  description = "CloudCheckr-CloudWatchFlowLogs-Policy"
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
      "Resource":"arn:aws:logs:*:*:*",
      "Effect": "Allow",
      "Sid": "CloudWatchLogsSpecific"
    }
  ]
}
EOF
}

#Policy CloudTrail
resource "aws_iam_policy" "CloudTrailPolicy" {
  name        = "CloudCheckr-CloudTrail-Policy"
  path        = "/"
  description = "CloudCheckr-CloudWatchFlowLogs-Policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Action": [
			"s3:GetBucketACL",
			"s3:GetBucketLocation",
			"s3:GetBucketLogging",
			"s3:GetBucketPolicy",
			"s3:GetBucketTagging",
			"s3:GetBucketWebsite",
			"s3:GetBucketNotification",
			"s3:GetLifecycleConfiguration",
			"s3:GetNotificationConfiguration",
			"s3:GetObject",
			"s3:List*"
		],
        "Resource": [
			"arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.bucket}",
            "arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.bucket}/*"
		],
        "Effect": "Allow",
        "Sid": "CloudTrailPermissions"
    }
  ]
}
EOF
}


#Policy SecurityPolicy
resource "aws_iam_policy" "SecurityPolicy" {
  name        = "CloudCheckr-Security-Policy"
  path        = "/"
  description = "CloudCheckr-Security-Policy"
  policy      = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
  	    "Sid": "SecurityPermissons",
  	    "Effect":"Allow",
  	    "Action":[
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
  	    		"sns:GetSnsTopic",
  	    		"sns:GetTopicAttributes",
  	    		"sns:GetSubscriptionAttributes",
  	    		"sns:ListTopics",
  	    		"sns:ListSubscriptionsByTopic",
  	    		"sqs:ListQueues",
  	    		"sqs:GetQueueAttributes"
  		],
  	    "Resource": "*"
    }
  ]
}
EOF
}

#Policy InventoryPolicy
resource "aws_iam_policy" "InventoryPolicy" {
  name        = "CloudCheckr-Inventory-Policy"
  path        = "/"
  description = "CloudCheckr-Inventory-Policy"
  policy      = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
		"Sid":"InventoryAndUtilization",
		"Effect":"Allow",
		"Action":[
			"access-analyzer:ListAnalyzers",
            "acm:DescribeCertificate",
            "acm:ListCertificates",
            "acm:GetCertificate",
            "ec2:Describe*",
            "ec2:GetConsoleOutput",
            "ec2:GetEbsEncryptionByDefault",
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
		"Resource":"*"
	}
  ]
}                    
EOF
}

#Policy DbrPolicy
resource "aws_iam_policy" "DbrPolicy" {
  name        = "CloudCheckr-DBR-Policy"
  path        = "/"
  description = "CloudCheckr-DBR-Policy"
  policy      = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
  	    "Sid":"CostReadDBR",
  	    "Effect":"Allow",
  	    "Action":[
  	    	"s3:GetBucketACL",
  	    	"s3:GetBucketLocation",
  	    	"s3:GetBucketLogging",
  	    	"s3:GetBucketPolicy",
  	    	"s3:GetBucketTagging",
  	    	"s3:GetBucketWebsite",
  	    	"s3:GetBucketNotification",
  	    	"s3:GetLifecycleConfiguration",
  	    	"s3:GetNotificationConfiguration",
  	    	"s3:GetObject"
  	    ],
  	    "Resource":[
  	    	"arn:aws:s3:::${aws_s3_bucket.billing_bucket.bucket}",
  	    	"arn:aws:s3:::${aws_s3_bucket.billing_bucket.bucket}/*"
  	    ]
    }
  ]
}
EOF
}

#Policy CurPolicy
resource "aws_iam_policy" "CurPolicy" {
  name        = "CloudCheckr-CUR-Policy"
  path        = "/"
  description = "CloudCheckr-CUR-Policy"
  policy      = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
  	    "Sid":"CostReadCUR",
  	    "Effect":"Allow",
  	    "Action":"s3:GetObject",
  	    "Resource":[
  	    	"arn:aws:s3:::${aws_s3_bucket.cur_bucket.bucket}",
  	    	"arn:aws:s3:::${aws_s3_bucket.cur_bucket.bucket}/*"
  	    ]
    }
  ]
}
EOF
}

#Policy CostPolicy
resource "aws_iam_policy" "CostPolicy" {
  name        = "CloudCheckr-Cost-Policy"
  path        = "/"
  description = "CloudCheckr-Cost-Policy"
  policy      = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
  	    "Sid":"CostReadCUR",
  	    "Effect":"Allow",
  	    "Action": [
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
			"s3:GetNotificationConfiguration",
			"s3:List*",
			"dynamodb:DescribeReservedCapacity",
			"dynamodb:DescribeReservedCapacityOfferings",
			"iam:GetAccountAuthorizationDetails",
			"iam:ListRolePolicies",
			"iam:ListAttachedRolePolicies"
		],
  	    "Resource": "*"
    }
  ]
}
EOF
}
