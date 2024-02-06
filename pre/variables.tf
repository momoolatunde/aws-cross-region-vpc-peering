# Global tags
variable "global_tags" {
  description = "A map of tags to be applied to all resources."
  type        = map(string)
  default = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
