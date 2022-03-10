variable "project_name" {
  default = "airflow"
}

variable "region" {
  default = "asia-east1"
}

variable "env" {
  default = "dev"
}

variable "fw_allow_source_ranges" {
  type    = list(string)
  default = []
}

variable "fw_allow_protocol" {
  type    = string
  default = "tcp"
}

variable "fw_allow_ports" {
  type    = list(string)
  default = ["0-65535"]
}

variable "subnet_cidr" {
  default = "10.1.0.0/16"
}

variable "gce_machine_type" {
  default = "n1-standard-1"
}

variable "gce_zone" {
  default = "asia-east1-a"
}
