# Puppet manifest for my PHP dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class db_server{
	require yum
	include iptables
	include misc
	include db
	include memcache

	file { "/etc/my.cnf":
		replace => true,
		ensure  => present,
		source  => "/vagrant/files/my.cnf",
		notify => Service["mysqld"]
	}
}
include db_server