class varnish
{
	File {
    owner   => "root",
    group   => "root",
    mode    => 644
  }

	exec { "grap-varnish-yum":
    command => "/bin/rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release-3.0-1.noarch.rpm",
    creates => "/etc/yum.repos.d/varnish.repo",
    alias   => "grap-varnish-yum",
  }

  package { "varnish":
    ensure => present,
    require => Exec["grap-varnish-yum"]
  }

  service { 'varnish':
    name      => 'varnish',
    require   => Package["varnish"],
    ensure    => running,
    enable    => true
  }

  file { "/etc/varnish/default.vcl":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/varnish/default.vcl",
    require => Package["varnish"],
    notify => Service["varnish"]
  }

  file { "/etc/sysconfig/varnish":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/varnish/varnish.conf",
    require => Package["varnish"],
    notify => Service["varnish"]
  }

}