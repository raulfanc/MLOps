variable "project" {
  description = "de-learning-20190409"    # my project id as a reminder when creating with terraform
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
  default     = "australia-southeast1"
}

variable "zone" {
  description = "The zone to deploy resources in"
  type        = string
  default     = "australia-southeast1-b"
}

variable "username" {
  description = "The username for the VM instance"
  type        = string
  default     = "rex"
}