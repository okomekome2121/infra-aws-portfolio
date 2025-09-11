locals {
  name = "${var.environment}-test"

  detail = length(var.instance_ids) > 0 ? {
    state        = ["stopped"]
    "instance-id" = var.instance_ids
  } : {
    state = ["stopped"]
  }

  event_pattern = {
    source        = ["aws.ec2"]
    "detail-type" = ["EC2 Instance State-change Notification"]
    detail        = local.detail
  }
}

resource "aws_cloudwatch_event_rule" "ec2_stopped" {
  name        = var.name
  description = "Notify when EC2 instance state becomes stopped"

  event_pattern = jsonencode(local.event_pattern)
}

# Target: SNS
resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.ec2_stopped.name
  target_id = "SendToSNS"
  arn       = var.sns_topic_arn
}

resource "aws_cloudwatch_event_target" "to_sns" {
  rule      = aws_cloudwatch_event_rule.ec2_stopped.name
  target_id = "sns"
  arn       = var.sns_topic_arn

  input_transformer {
    input_paths = {
      id    = "$.detail.instance-id"
      state = "$.detail.state"
      time  = "$.time"
      region= "$.region"
    }
    input_template = "\"${var.input_template}\""
  }
}


