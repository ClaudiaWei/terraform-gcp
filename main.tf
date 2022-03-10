# gce 1
# vpc 1
# static ip 1
# firewall rules ?

# region
# zone
# gce instance type
# firewall rules allow port and source range

resource "google_compute_network" "vpc_network" {
  name = "${var.project_name}-${var.env}"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-${var.project_name}-${var.env}"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "allow_access" {
  name    = "fw-allow-access-${var.env}"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = var.fw_allow_protocol
    ports    = var.fw_allow_ports
  }

  source_ranges = var.fw_allow_source_ranges
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_instance" "default" {
  name         = "${var.project_name}-${var.env}-instance"
  machine_type = var.gce_machine_type
  zone         = var.gce_zone

  boot_disk {

    initialize_params {
      image = "centos-7-v20180129"
    }
  }

  network_interface {

    subnetwork = google_compute_subnetwork.subnet.name

    access_config {
      // Ephemeral IP
      nat_ip = google_compute_address.static.address
    }
  }
}
