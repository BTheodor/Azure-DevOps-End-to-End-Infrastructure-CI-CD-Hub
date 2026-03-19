variable "project_name" {
  type        = string
  description = "Name of the project."
  default     = "azdevops-cicd-hub"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, prod)."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region for resources."
  default     = "westeurope"
}