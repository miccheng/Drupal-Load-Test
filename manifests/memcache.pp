class memcache
{
  package { "memcached":
    ensure  => present,
  }

  service { 'memcached':
    name      => 'memcached',
    require   => Package["memcached"],
    ensure    => running,
    enable    => true
  }

  # file { "/etc/httpd/conf.d/phpMemcachedAdmin.conf":
  #   replace => true,
  #   ensure  => present,
  #   source  => "/vagrant/files/httpd/conf.d/phpMemcachedAdmin.conf",
  # }

  # package { "phpMemcachedAdmin":
  #   ensure => installed,
  # }
}