resource "aws_s3_bucket" "tf_remote_state" {
    bucket = "tf_state ${var.env_name} - ${var.region} - $ {random_string.suffix.result}"
    lifecycle {
      prevent_destroy = false
      }
      tags = {
        Name = "tf_state ${var.env_name} - ${var.region} - $ {random_string.suffix.result}"
        Project = "remote_backend"
      }
    }

    reource "aws_s3_bucket_versioning" "tf_state_versioning" {
        bucket = aws_s3_bucket.tf_remote_state.id
        versioning_configuration {
          enabled = true
        }
  }