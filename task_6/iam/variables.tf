variable "region" {
  type        = string
  description = "Region to deploy into e.g: us-east-1"
}
variable "profile" {
  type    = string
  default = "greenreb"
}
variable "account_id" {
  type    = string
  default = ""
}
variable "allowed_user" {
  type    = string
  default = ""
}
