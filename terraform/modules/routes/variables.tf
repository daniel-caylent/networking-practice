variable tags {
    default = {}
    description = "tags passed in from parent module"
}

variable vpc_id {
    description = "vpc id passed in from parent module"
}

variable igw_id {
    description = "internet gateway id passed in from parent module"
}

variable "public_subnets" {
    description = "list of public subnet ids"
}

variable "private_subnets" {
    description = "list of private subnet ids"
}
