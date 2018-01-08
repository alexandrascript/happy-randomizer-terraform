variable "zone_name" {
	type = "string"
}

variable "host_name" {
	type = "string"
}

variable "host_ip_list" {
	type = "list"
}

variable "ttl" {
	type = "string"
}

variable "zone_id" {
	type = "string"
}
variable "staging_ip_list" {
	type = "list"
}

provider "cloudflare" {
  email = "alexandra.n.white@gmail.com"
  token = "c1d131e37927d52379ae1a30d6e550a5752e8"
}

resource "cloudflare_record" "a" {
	count = "${length(var.host_ip_list)}"
    domain = "${var.zone_name}"
    name = "${var.host_name}"
    value = "${element(var.host_ip_list, count.index)}"
    type = "A"
    ttl = "${var.ttl}"
}
