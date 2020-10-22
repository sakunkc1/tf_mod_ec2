variable  "instance_type" {
    type  = string
    default = "t2.micro"
}

variable "keyname"{
    type = string
    default = "aug2020"
}
variable "availability_zone" {
  default = "a"
}
variable "lb_name" {
  type    = string
  default = ""
}