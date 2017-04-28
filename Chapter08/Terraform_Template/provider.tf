provider "openstack" {
 user_name = "${var.OS_USERNAME}"
 tenant_name = "${var.OS_TENANT}"
 password  = "${var.OS_PASSWORD}"
 auth_url  = "${var.OS_AUTH_URL}"
}
