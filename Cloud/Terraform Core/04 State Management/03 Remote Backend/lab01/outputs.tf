output "s3_bucket_tfstate" {
  value = {
    bucket = aws_s3_bucket.tfstate.bucket
    arn    = aws_s3_bucket.tfstate.arn
  }
}
