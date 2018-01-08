#
# Details about all deployments of this application
#
variable "service_production" {
    type = "string"
    description = "Which deployment is considered 'production'? The other is 'staging'. Value can be one of 'blue' or 'green'."
    default = "blue"
}

variable "service_name" {
    type = "string"
    description = "The name of the service in CNS."
    default = "happiness"
}

variable "service_networks" {
    type = "list"
    description = "The name or ID of one or more networks the service will operate on."
    default = ["Joyent-SDC-Public"]
}


#
# Details about the "blue" deployment
#
variable "blue_image_name" {
	type = "string"
    description = "The name of the image for the 'blue' deployment."
    default = "happy_randomizer"
}

variable "blue_image_version" {
    type = "string"
    description = "The version of the image for the 'blue' deployment."
    default = "1.0.0"
}

variable "blue_package_name" {
    type = "string"
    description = "The package to use when making a blue deployment."
    default = "g4-highcpu-128M" 
}

#
# Details about the "green" deployment
#
variable "green_image_name" {
    type = "string"
    description = "The name of the image for the 'green' deployment."
    default = "happy_randomizer"
}

variable "green_image_version" {
    type = "string"
    description = "The version of the image for the 'green' deployment."
    default = "1.1.0"
}

variable "green_package_name" {
    type = "string"
    description = "The package to use when making a green deployment."
    default = "g4-highcpu-128M" 
}

#
# Details about the deployments for each data center
#
module "east" {
	source = "./modules/service"
	region_name = "us-east-1"

	blue_count = 3
	green_count = 3
	
	service_production = "${var.service_production}"
	service_name = "${var.service_name}"
	service_networks = "${var.service_networks}"

	blue_image_name = "${var.blue_image_name}"
	blue_image_version = "${var.blue_image_version}"
	blue_package_name = "${var.blue_package_name}"
	green_image_name = "${var.green_image_name}"
	green_image_version = "${var.green_image_version}"
	green_package_name = "${var.green_package_name}"
}

module "sw" {
	source = "./modules/service"
	region_name = "us-sw-1"

	blue_count = 0
	green_count = 3
	
	service_production = "${var.service_production}"
	service_name = "${var.service_name}"
	service_networks = "${var.service_networks}"

	blue_image_name = "${var.blue_image_name}"
	blue_image_version = "${var.blue_image_version}"
	blue_package_name = "${var.blue_package_name}"
	green_image_name = "${var.green_image_name}"
	green_image_version = "${var.green_image_version}"
	green_package_name = "${var.green_package_name}"
}

module "west" {
	source = "./modules/service"
	region_name = "us-west-1"

	blue_count = 3
	green_count = 0
	
	service_production = "${var.service_production}"
	service_name = "${var.service_name}"
	service_networks = "${var.service_networks}"

	blue_image_name = "${var.blue_image_name}"
	blue_image_version = "${var.blue_image_version}"
	blue_package_name = "${var.blue_package_name}"
	green_image_name = "${var.green_image_name}"
	green_image_version = "${var.green_image_version}"
	green_package_name = "${var.green_package_name}"
}


#
# Details for Cloudflare
# Host IP addresses are 'green' instances, 'staging' are blue.
#

module "dns" {
	source = "./modules/dns"

	zone_name = "alexandra.space"
	zone_id = "2862323eda793e5d35031cc30027d682"
	host_name = "@"
	ttl = "300"

	host_ip_list = ["72.2.113.111", "72.2.112.9", "165.225.137.139", "165.225.157.234", "165.225.157.158", "165.225.157.17"]
	staging_ip_list = ["165.225.150.82", "165.225.151.28", "165.225.149.136", "72.2.112.26", "165.225.139.56", "72.2.113.132"]
}