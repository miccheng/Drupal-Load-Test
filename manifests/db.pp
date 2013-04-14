class db {
  class { 'mysql': }
  class { 'mysql::server': 
    config_hash => { 'bind_address' => '192.168.56.63' }
  }

  Database {
	  require => Class['mysql::server'],
	}
  database{ 'drupaltest':
	  ensure  => present,
	  charset => 'utf8',
	}
  database_user{ 'drupaltest@%':
	  ensure        => present,
	  password_hash => mysql_password('password1'),
	}
  database_grant { 'drupaltest@%/drupaltest':
  	privileges => ['all'] ,
	}
}
