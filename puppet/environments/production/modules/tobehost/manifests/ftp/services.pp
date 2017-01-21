class tobehost::ftp::services inherits tobehost::ftp {

	# Vsftpd
	service { 'vsftpd':
		ensure  => 'running',
		enable  => 'true',
		hasrestart => 'true',
		require => Package['vsftpd'],
	}

}
