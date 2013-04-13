class php {

  File {
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Package["httpd"],
    notify  => Service["httpd"]
  }

  package { "php":
    ensure  => present,
  }

  package { "php-cli":
    ensure  => present,
  }

  package { "php-common":
    ensure  => present,
  }

  package { "php-devel":
    ensure  => present,
  }

  package { "php-gd":
    ensure  => present,
  }

  package { "php-mcrypt":
    ensure  => present,
  }

  package { "php-intl":
    ensure  => present,
  }

  package { "php-mbstring":
    ensure  => present,
  }

  package { "php-mysql":
    ensure  => present,
  }

  package { "php-pdo":
    ensure  => present,
  }

  package { "php-pear":
    ensure  => present,
  }

  package { "php-soap":
    ensure  => present,
  }

  package { "php-xml":
    ensure  => present,
  }

  package { "php-domxml-php4-php5":
    ensure  => present,
  }

  package { "uuid-php":
    ensure  => present,
  }

  package { "php-pecl-memcached":
    ensure  => present,
  }

  package { "php-pecl-xdebug":
    ensure  => present,
    require => Exec["grab-epel"]
  }

  package { "php-pecl-apc":
    ensure  => present,
  }

  file { "/etc/php.ini":
    replace => true,
    ensure  => present,
    source  => "/vagrant/files/php.ini",
  }
}