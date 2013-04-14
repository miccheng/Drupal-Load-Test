# Puppet manifest for my PHP dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class db_server{
	require yum
	include iptables
	include misc
	include db
	include memcache
}
include db_server