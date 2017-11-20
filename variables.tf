variable "production" {
  type = "string"
  default = "blue"
}

variable "staging" {
  type = "string"
  default = "staging-happiness"
}

variable "service_name" {
	default = "happiness"
}

variable "green_image_name" {
    default = "happy_randomizer"
}

variable "green_image_version" {
    default = "1.0.0"
}

variable "green_count" {
    description = "Number of green machines to create"
    default = "0"
}

variable "blue_image_name" {
    default = "happy_randomizer"
}

variable "blue_image_version" {
    default = "1.1.0"
}

variable "blue_count" {
    description = "Number of blue machines to create"
    default = "3"
}