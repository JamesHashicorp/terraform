variable "instance_name" {
  description = "Value of the Name tag for the EC2 Instance"
  type = string
  default = "UnnamedServer"
}

variable "workspace" {
    description = "Name of workspace to be applied against"
    type = string
    default = "AWS-IaaS-Development"
}