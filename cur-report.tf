resource "aws_cur_report_definition" "this" {
  count                      = var.create_cur_report == true ? 1 : 0
  report_name                = var.cur_report_name
  time_unit                  = "HOURLY"
  format                     = "textORcsv"
  compression                = "GZIP"
  additional_schema_elements = ["RESOURCES"]
  s3_bucket                  = aws_s3_bucket.cur[0].id
  s3_prefix                  = "cur"
  s3_region                  = aws_s3_bucket.cur[0].region
  additional_artifacts       = ["REDSHIFT", "QUICKSIGHT"]
  refresh_closed_reports     = true
  report_versioning          = "OVERWRITE_REPORT"
}
