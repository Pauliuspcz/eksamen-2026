resource "aws_cloudwatch_metric_alarm" "slow_bedrock" {
  alarm_name  = "wishifai-${var.kandidatnummer}-slow-bedrock"
  namespace   = "wishifai-${var.kandidatnummer}"
  metric_name = "bedrock_latency.avg"

  dimensions = {
    class     = "no.pgr301.exam.service.BedrockService"
    method    = "suggestGifts"
    exception = "none"
  }

  comparison_operator = "GreaterThanThreshold"
  threshold           = 20000
  evaluation_periods  = "2"
  period              = "60"
  statistic           = "Average"

  alarm_description = "Bedrock-kallet bruker over 20 sekunder i snitt."
}