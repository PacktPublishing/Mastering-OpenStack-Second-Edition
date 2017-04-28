variable "OS_USERNAME" {
   description = "The username for the Tenant."
   default  = "pp_user"
}

variable "OS_TENANT" {
   description = "The name of the Tenant."
   default  = "pp_tenant"
}

variable "OS_PASSWORD" {
   description = "The password for the Tenant."
   default  = "367811794c1d45b4"
}

variable "OS_AUTH_URL" {
   description = "The endpoint url to connect to the Cloud Controller OpenStack."
   default  = "http://10.0.10.10:5000/v2.0"
}


variable "OS_REGION_NAME" {
   description = "The region to be used."
   default  = "RegionOne"
}

variable "image" {
 description = "Default image for web server"
 default = "centos"
}

variable "flavor" {
  description = "Default flavor for web server instance"
  default = "m1.small"
}

variable "ssh_key_file" {
  description = "Public SSH key for passwordless access the server."
  default = "~/.ssh/pubkey"
}

variable "ssh_user_name" {
 description = "Default SSH user configured in the centos image uploaded by glance."
 default = "centos"
}


variable "private_network" {
 description = "Default private network created in OpenStack"
 default = "Private_Network"
}

variable "private_subnet" {
 description = "Default private subnet network which the web server will be attached to"
 default = "Private_Subnet"
}

variable "router" {
description = "Default Neutron Router created in OpenStack"
default = "pp_router"
}

variable "external_gateway" {
description = "Default External Router Interface ID"
default =  "ac708df9-23b1-42dd-8bf1-458189db71c8"
}

variable "public_pool" {
 description = "Default public network to assign floating IP for external access"
 default = "Public_Network"
}


