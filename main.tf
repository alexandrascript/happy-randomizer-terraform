provider "triton" {
    # Commenting these out because they will take the SDC_URL, SDC_ACCOUNT, and SDC_KEY_ID env vars as defaults
    # url = "https://${var.dc_name}.api.joyent.com"
    # account = "${var.triton_account}"
    # key_id = "${var.triton_key_id}"
}

#
# Details about the "blue" deployment
#
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
    networks = "${ var.service_networks }"
    cns {
        services = ["${var.service_production == "blue" ? var.service_name : "staging-${var.service_name}" }", "blue-${var.service_name}"]
    }
}

#
# Details about the "green" deployment
#
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
    networks = "${ var.service_networks }"
    cns {
        services = ["${var.service_production == "green" ? var.service_name : "staging-${var.service_name}" }", "blue-${var.service_name}"]
    }
}

