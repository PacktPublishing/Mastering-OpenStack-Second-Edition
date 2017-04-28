resource "openstack_compute_keypair_v2" "mykey" {
 name       = "mykey"
 public_key = "${file("${var.ssh_key_file}.pub")}"
}

resource "openstack_compute_secgroup_v2" "ws_sg" {
 name        = "ws_sg"
 description = "Security group for the Web Server instances"

 rule {
   from_port   = 22
   to_port     = 22
   ip_protocol = "tcp"
   cidr        = "192.168.0.0/16"
 }

 rule {
   from_port   = 80
   to_port     = 80
   ip_protocol = "tcp"
   cidr        = "0.0.0.0/0"
 }

 rule {
   from_port   = 443
   to_port     = 443
   ip_protocol = "tcp"
   cidr        = "0.0.0.0/0"
 }
}

resource "openstack_compute_floatingip_v2" "fip" {
 pool       = "${var.public_pool}"
}

resource "openstack_compute_instance_v2" "web_server" {
 name            = "web_server"
 image_name      = "${var.image}"
 flavor_name     = "${var.flavor}"
 key_pair        = "${openstack_compute_keypair_v2.mykey.name}"
 security_groups = ["${openstack_compute_secgroup_v2.ws_sg.name}"]
 floating_ip     = "${openstack_compute_floatingip_v2.fip.address}"

 network {
   uuid = "${var.Private_Network}"
 }

 provisioner "remote-exec" {
   connection {
     user     = "${var.ssh_user_name}"
     secret_key_ = "/root/.ssh/id_rsa"
     timeout = "20m"
   }

   user_data = "${file("postscript.sh")}"

 }
}

