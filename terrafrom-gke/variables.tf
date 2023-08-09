variable "region" {
  description = "Region"
  type        = string
  default     = "us-central1"
}

variable "project_id" {
  description = "Proj ID"
  type        = string
  default     = ""
}


variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}
