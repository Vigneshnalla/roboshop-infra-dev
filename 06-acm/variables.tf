variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type = map(string)
  default = {
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "true"
    Component   = "app-alb"
  }
}

variable "zone_name" {
  default = "vigneshdev.online"
}

variable "zone_id" {
  default = "Z02765143G44F5CGCM5Q8"
}