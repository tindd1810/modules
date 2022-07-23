variable "alb-name" {
  description = "alb-name"
}
variable "target-group-name" { 
  description = "target-group-name"
}

variable "lambda-function-name" {
  description = "Lambda function's name"
}

variable "env" {
  description = "environment"
}
variable "bucket" {
  description = ""
  default = "dinhlehoangdemo-terraform-state-testing"
}