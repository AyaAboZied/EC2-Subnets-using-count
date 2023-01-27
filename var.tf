
variable "vpc-cider" {
  type = string
  #default = "10.0.0.0/16"
}

variable "ec2-var" {
  type    = list(string)
  #default = ["ami-00874d747dde814fa", "t2.micro" ]
}


variable "subn-cider" {
  type    = list(string)
  #default = "10.0.0.0/24"
}


