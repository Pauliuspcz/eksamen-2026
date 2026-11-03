resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "wishifai-${var.kandidatnummer}"
  dashboard_body = <<DEATHSTAR
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["wishifai-${var.kandidatnummer}", "gift_suggestions.count"]
        ],
        "period": 300,
        "stat": "Sum",
        "region": "eu-west-1",
        "title": "Gaveforslag generert"
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["wishifai-${var.kandidatnummer}", "bedrock_latency.avg", "class", "no.pgr301.exam.service.BedrockService", "exception", "none", "method", "suggestGifts"],
          ["wishifai-${var.kandidatnummer}", "rekognition_latency.avg", "class", "no.pgr301.exam.service.RekognitionService", "exception", "none", "method", "detectLabels"]
        ],
        "period": 300,
        "stat": "Average",
        "region": "eu-west-1",
        "title": "Bedrock vs Rekognition (ms)"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/ECS", "CPUUtilization", "ClusterName", "default", "ServiceName", "wishifai-${var.kandidatnummer}"],
          ["AWS/ECS", "MemoryUtilization", "ClusterName", "default", "ServiceName", "wishifai-${var.kandidatnummer}"]
        ],
        "period": 300,
        "stat": "Average",
        "region": "eu-west-1",
        "title": "ECS CPU og minne (%)"
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["wishifai-${var.kandidatnummer}", "http.server.requests.avg", "error", "none", "exception", "none", "method", "POST", "outcome", "SUCCESS", "status", "200", "uri", "/api/analyze"]
        ],
        "period": 300,
        "stat": "Average",
        "region": "eu-west-1",
        "title": "HTTP latency /api/analyze (ms)"
      }
    }
  ]
}
DEATHSTAR
}