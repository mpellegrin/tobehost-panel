class tobehost::ftp::install inherits tobehost::ftp {

	package {'vsftpd':
		ensure => 'present',
	}


}
