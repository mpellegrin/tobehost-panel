class ftp::install inherits ftp {

	package {'vsftpd':
		ensure => 'present',
	}


}
