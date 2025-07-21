# SNS Topic
resource "aws_sns_topic" "dev-test" {
  name = var.topic_name
}

# Email Subscription
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.dev-test.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

# Event pattern: 全EC2 or instance_ids指定
locals {
  # Base pattern
  event_pattern_base = {
    "source"      = ["aws.ec2"]
    "detail-type" = ["EC2 Instance State-change Notification"]
    "detail" = {
      "state" = ["stopped"]
    }
  }

  # instance_idsが指定されている場合に detail.instance-id を追加
  event_pattern = length(var.instance_ids) > 0 ? merge(
    local.event_pattern_base,
    {
      "detail" = merge(
        local.event_pattern_base.detail,
        { "instance-id" = var.instance_ids }
      )
    }
  ) : local.event_pattern_base
}

# EventBridge Rule
resource "aws_cloudwatch_event_rule" "ec2_stopped" {
  name          = "${var.topic_name}-rule"
  description   = "Trigger when specified EC2 instances stop (or all if none specified)."
  event_pattern = jsonencode(local.event_pattern)
}

# Target: SNS
resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.ec2_stopped.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.dev-test.arn
}

# Allow EventBridge to publish to SNS
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
    resources = [aws_sns_topic.dev-test.arn] 
  }
}

resource "aws_sns_topic_policy" "dev-test" {
  arn    = aws_sns_topic.dev-test.arn
  policy = data.aws_iam_policy_document.sns_policy.json
}
