variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "kandidatnummer" {
  type    = string
  default = "16"
}

variable "image_tag" {
  type        = string
  description = "Image tag in ECR (commit SHA from CI)"
}