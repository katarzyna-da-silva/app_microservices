variable "cluster_name" {
  description = "name cluster for config"
  type        = string
  default     = "eks"
}

variable "cluster_version" {
  description = "version"
  type        = string
  default     = ""
}
