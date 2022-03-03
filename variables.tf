variable "region" {
  description = "Please Enter AWS Region to deploy Server"
  type        = string
  default     = "us-west-2"
}

variable "instances" {
  description = "Number of instances to run"
  type        = number
  default     = 1
}

variable "urls" {
  description = "List of urls"
  type        = list
  default     = [
    "https://nowar",
  ]
}
