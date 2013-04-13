class nginx_lbal
{
	File {
    owner   => "root",
    group   => "root",
    mode    => 644
  }

  file { "/etc/yum.repos.d/nginx.repo":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/nginx.repo"
  }

  package { "nginx":
    ensure => present,
    require => File["/etc/yum.repos.d/nginx.repo"]
  }

  service { 'nginx':
    name      => 'nginx',
    require   => Package["nginx"],
    ensure    => running,
    enable    => true
  }

  file { "/etc/nginx/conf.d/default.conf":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/nginx/default.conf",
    require => Package["nginx"],
    notify => Service["nginx"]
  }
}