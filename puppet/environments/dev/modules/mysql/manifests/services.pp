class mysql::services inherits mysql {

	service { 'mysql':
		ensure  => 'running',
		enable  => 'true',
		hasrestart => 'true',
		require => Package['mariadb-server'],
	}

}
