variable "env" {
  type        = string
  description = "This variable contains environment"
  
}

variable "ami_id" {
  type        = string
  description = "This variable contains ami_id"
  default = "ami-0ec10929233384c7f"
  
}

variable "instance_type" {
  type        = string
  description = "This variable contains innstance_type"
  default = "t3.micro"
  
}

variable "instance_count" {
  type        = string
  description = "This variable contains innstance_count"

  
}