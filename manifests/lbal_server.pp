# Puppet manifest for my PHP dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class lbal{
	require yum
	include iptables
	include misc
	include nginx_lbal
	include varnish
}
include lbal