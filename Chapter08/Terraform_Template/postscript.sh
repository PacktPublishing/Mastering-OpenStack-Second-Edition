#!/bin/bash
yum -y install httpd
systemctl enable httpd.service
systemctl start httpd.service
chkconfig --level 2345 httpd on
