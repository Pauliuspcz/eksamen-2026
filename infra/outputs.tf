output "url" {
  value = aws_ecs_express_gateway_service.app.ingress_paths[0].endpoint
}

output "bucket_name" {
  value = aws_s3_bucket.images.bucket
}