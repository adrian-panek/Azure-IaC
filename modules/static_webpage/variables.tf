variable "name" {
  type    = string
  default = "index.html"
}

variable "storage_account_id" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_container_name" {
  type    = string
  default = "$web"
}

variable "type" {
  type    = string
  default = "Block"
}

variable "content_type" {
  type    = string
  default = "text/html"
}

variable "content_source" {
  type    = string
  default = "index.html"
}