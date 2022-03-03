variable "region" {
  description = "Please Enter AWS Region to deploy Server"
  type        = string
  default     = "us-west-2"
}

variable "urls" {
  description = "List of urls"
  type        = list
  default     = [
    "https://nowar",
  ]
}
