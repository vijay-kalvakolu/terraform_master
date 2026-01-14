resource "aws_s3_bucket" "tfstate_bucket" {
    bucket = "tf_state ${var.env_name} - ${var.region} - $ {random_string.suffix.result}"
    lifecycle {
      prevent_destroy = false
      }
      tags = {
        Name = "tf_state ${var.env_name} - ${var.region} - $ {random_string.suffix.result}"
        Project = "remote_backend"
      }
    }

    resource "aws_s3_bucket_versioning" "tf_state_versioning" {
        bucket = aws_s3_bucket.tfstate_bucket.id
        versioning_configuration {
          status = "Enabled"
        }
  }

  resource "aws_s3_bucket_server_side_encryption_config" "tfstate_encryption" {
        bucket = aws_s3_bucket.tfstate_bucket.id
            value {
                apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"

                }
            }

  }