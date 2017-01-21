class tobehost::ftp::config inherits tobehost::ftp {

	file { '/etc/vsftpd.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['vsftpd'],
		source => 'puppet:///modules/ftp/vsftpd/vsftpd.conf',
	}

}
