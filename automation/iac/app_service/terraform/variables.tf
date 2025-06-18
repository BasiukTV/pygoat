# Common Variables

variable "org" {
  description = "The name of the organization that owns the resources."
  type        = string
  default     = "taras"
}

variable "app" {
  description = "The name of the application that uses the resources."
  type        = string
  default     = "devsecoppapp"
}

variable "stage" {
  description = "The stage of the application (e.g., dev, test, prod)."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = "westus2"
}

# Additional Variables
variable "enable_telemetry" {
  description = "Flag to enable or disable telemetry."
  type        = bool
  default     = false
}
