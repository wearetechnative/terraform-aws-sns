resource "aws_sns_topic" "this" {
  name_prefix = "${var.name}-"
  display_name = var.name

  # delivery_policy
  # application_success_feedback_role_arn
  # application_success_feedback_sample_rate
  # application_failure_feedback_role_arn
  # http_success_feedback_role_arn
  # http_success_feedback_sample_rate
  # http_failure_feedback_role_arn

  kms_master_key_id = var.kms_key_arn
  fifo_topic = false

  content_based_deduplication = false

  # lambda_success_feedback_role_arn
  # lambda_success_feedback_sample_rate
  # lambda_failure_feedback_role_arn
  # sqs_success_feedback_role_arn
  # sqs_success_feedback_sample_rate
  # sqs_failure_feedback_role_arn  = null
  # firehose_success_feedback_role_arn
  # firehose_success_feedback_sample_rate
  # firehose_failure_feedback_role_arn
}
