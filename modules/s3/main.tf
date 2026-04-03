resource "aws_s3_bucket" "my-bucket" {
  count = var.bucket_count
  bucket = "${var.env}-terra-bucket-${count.index + 1}"

  tags = {
    Name        = "${var.env}-terra-bucket-${count.index + 1}"
    Environment = "${var.env}"
  }
}