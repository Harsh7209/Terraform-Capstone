resource "aws_dynamodb_table" "my-table" {
  count = var.table_count
  name           = "${var.env}-terra-table-${count.index + 1}"
  billing_mode   = "PAY_PER_REQUEST" 
  hash_key       = "UserId"


  attribute {
    name = "UserId"
    type = "S" 
  }
}