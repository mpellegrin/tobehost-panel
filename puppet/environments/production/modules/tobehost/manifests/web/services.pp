class tobehost::web::services inherits tobehost::web {

	# Apache
	service { 'apache2':
		ensure  => 'running',
		enable  => 'true',
		hasrestart => 'true',
		require => Package['apache2'],
	}


}
