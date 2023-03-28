resource "aws_sns_topic_policy" "this" {
  count = length(data.aws_iam_policy_document.this) > 0 ? 1 : 0

  arn = aws_sns_topic.this.arn

  policy = data.aws_iam_policy_document.combined.json
}

data "aws_iam_policy_document" "combined" {
  source_policy_documents = [ for k, v in data.aws_iam_policy_document.this: v.json ]
}

data "aws_iam_policy_document" "this" {
  for_each = var.policy_allowed

  statement {
    sid = "${each.key}"
    effect = "Allow"

    actions = each.value.actions

    principals {
      type        = each.value.principal.type
      identifiers = each.value.principal.identities
    }

    resources = [ aws_sns_topic.this.arn ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"

      values = [ data.aws_caller_identity.current.account_id ]
    }
  }
}
