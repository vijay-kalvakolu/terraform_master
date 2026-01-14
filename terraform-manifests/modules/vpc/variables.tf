variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "env_name" {
  default = "dev"
}
variable "tags" {
    default = "dev-vpc"
  }