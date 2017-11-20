provider "triton" {
    url = "https://${var.dc_name}.api.joyent.com"
    account = "${var.triton_account}"
    key_id = "${var.triton_key_id}"
}

data "triton_network" "public" {
    name = "Joyent-SDC-Public"
}

data "triton_image" "green_image" {
    name = "${var.green_image_name}"
    version = "${var.green_image_version}"
    type = "lx-dataset"
    most_recent = true
}

resource "triton_machine" "green_machine" {
    count = "${var.green_count}"
    name = "green_happy_${count.index + 1}"
    package = "g4-highcpu-2G"
    image = "${data.triton_image.green_image.id}"
    networks = ["${data.triton_network.public.id}"]
    cns {
        services = ["${var.production == "green" ? var.service_name : var.staging }", "green-${var.service_name}"]
    }
}

data "triton_image" "blue_image" {
    name = "${var.blue_image_name}"
    version = "${var.blue_image_version}"
    type = "lx-dataset"
    most_recent = true
}

resource "triton_machine" "blue_machine" {
    count = "${var.blue_count}"
    name = "blue_happy_${count.index + 1}"
    package = "g4-highcpu-2G"
    image = "${data.triton_image.blue_image.id}"
    networks = ["${data.triton_network.public.id}"]
    cns {
        services = ["${var.production == "blue" ? var.service_name : var.staging }", "blue-${var.service_name}"]
    }
}
