output "cloudcheckr_role_arn" {
  description = "CloudChekr role ARN"
  value       = aws_iam_role.this.arn
}