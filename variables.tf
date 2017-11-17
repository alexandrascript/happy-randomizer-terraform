variable "triton_account" {
    default = "<username>"
}

variable "triton_key_id" {
    default = "<fingerprint>"
}

variable "dc_name" {
    default = "<dc_name>"
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