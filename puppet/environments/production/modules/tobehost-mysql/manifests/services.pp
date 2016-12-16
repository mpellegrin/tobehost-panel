class tobehost::mysql::services inherits tobehost::mysql {

	service { 'mysql':
		ensure  => 'running',
		enable  => 'true',
		hasrestart => 'true',
		require => Package['mariadb-server'],
	}

}
