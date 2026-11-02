resource "aws_s3_bucket" "images" {
  bucket = "wishifai-images-${var.kandidatnummer}"
}