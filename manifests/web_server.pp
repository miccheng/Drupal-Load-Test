# Puppet manifest for my PHP dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class web{
	require yum
	include iptables
	include misc
	include httpd
	include php
}
include web