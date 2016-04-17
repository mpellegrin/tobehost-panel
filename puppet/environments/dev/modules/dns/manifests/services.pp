class dns::services inherits dns {

	service { 'bind9':
		ensure  => 'running',
		enable  => 'true',
		hasrestart => 'true',
		require => Package['bind9'],
	}


}
