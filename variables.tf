

variable "vpc" {
  type    = string
  default = "10.0.0.0/16"
}

variable "zonea" {
  type    = string
  default = "us-west-2a"
}

variable "subneta" {
  type    = string
  default = "10.0.8.0/24"
}

variable "zoneb" {
  type    = string
  default = "us-west-2b"
}

variable "subnetb" {
  type    = string
  default = "10.0.9.0/24"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

# Essas variaveis tem finalidade apenas para teste
# variable "AWS_ACCES_KEY_ID" {
#   type    = string
#   default = "AKIA5X5I25IFGFK72GUQ"
# }

# variable "AWS_SECRET_ACCESS_KEY" {
#   type    = string
#   default = "TXrdj6pEPsQAPgtW1GTB6ji8F2mFqGfBIIma+2Z7"
# }