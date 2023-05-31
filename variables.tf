variable "database" {
  type = string
}

variable "collation" {
  type = string 
  default = "en_US.utf8"
}

variable "charset" {
  type = string
  default = "utf8"
}

variable "user" {
  type = string
}

variable "server_id" {
  type = string
}
