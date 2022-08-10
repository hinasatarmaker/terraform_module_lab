variable "vpc_id" {
    description = "This is the vpc id"
}

variable "is_public" {
    default     = false
    description = "True or false for public subnet"
}

variable "subnet_name" {
    description = "The name of subnet"
}

variable "subnet_cidr" {
    description = "The CIDR range for subnet"
}