resource "aws_sns_topic" "default" {
  name = "${var.environment}-${var.name_suffix}"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.default.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

data "aws_iam_policy_document" "sns_policy" {
  statement {
    sid = "AllowEventBridgePublish"
    actions = [
      "sns:Publish"
    ]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
    resources = [aws_sns_topic.default.arn] 
  }
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.default.arn
  policy = data.aws_iam_policy_document.sns_policy.json
}
