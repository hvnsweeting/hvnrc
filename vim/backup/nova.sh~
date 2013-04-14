mysql -u root -phehehe -Be 'drop database nova;'

mysql -u root -phehehe -Be 'create database nova;'
nova-manage db sync
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0

nova-manage network create private 192.168.100.0/24 1 256

killall dnsmasq
service nova-network restart
