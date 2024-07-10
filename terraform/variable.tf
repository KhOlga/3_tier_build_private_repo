variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "The VPC name"
}


variable "internet_gateway_name" {
  type        = string
  default     = "igw"
  description = "The default name for a internet_gateway"
}

variable "ami_image" {
  type = string
}

variable "ssh_key_name" {
  description = "Name to private key"
  type        = string
  sensitive   = true
}

variable "ssh_key_path" {
  description = "Path to private key"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "Type of AWS instance to deploy"
  type        = string
}

variable "subnets" {
  description = "List of AWS subnets"
  type        = any
}

variable "sg_name" {
  description = "List of security group names"
  type        = map(string)
}

variable "inbound_rule" {
  type = any
}

variable "instances" {
  type = any
}

variable "public_route_table_name" {
  description = "Public route table name"
  type        = string
}