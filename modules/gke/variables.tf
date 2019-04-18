# map for dynamic config of machine_type
variable "machines" {
  type    = "map"
  default = {
    "xs" = "n1-standard-1"
    "s" = "n1-standard-2"
    "m" = "n1-standard-4"
    "l" = "n1-standard-8"
    "xl" = "n1-standard-16"
  }
}
