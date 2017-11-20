#
# Details about all deployments of this application
#
variable "production" {
  type = "string"
  default = "blue"
}

variable "service_name" {
	default = "happiness"
}

#
# Details about the "blue" deployment
#
variable "blue_image_name" {
    default = "ubuntu-16.04"
}

variable "blue_image_version" {
    default = "20170403"
}

variable "blue_count" {
    description = "Number of blue machines to create"
    default = "3"
}

#
# Details about the "green" deployment
#
variable "green_image_name" {
    default = "ubuntu-14.04"
}

variable "green_image_version" {
    default = "20170403"
}

variable "green_count" {
    description = "Number of green machines to create"
    default = "0"
}
