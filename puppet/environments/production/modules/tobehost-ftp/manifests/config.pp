class tobehost::ftp::config inherits tobehost::ftp {

	file { '/etc/vsftpd.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['vsftpd'],
		source => 'puppet:///modules/ftp/vsftpd/vsftpd.conf',
	}

	file { '/etc/ssh/sftp.conf':
		ensure => 'file',
		mode   => '600',
		group  => '0',
		owner  => '0',
		notify => Service['sftp'],
		content => template('ftp/sftp/sshd_config.erb'),
	}

	file { '/lib/systemd/system/sftp.service':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['sftp'],
		source => 'puppet:///modules/ftp/systemd/sftp.service',
	}

	file { '/etc/systemd/system/sftp.service':
		ensure => 'link',
		target => '/lib/systemd/system/sftp.service',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['sftp'],
	}

	file { '/etc/systemd/system/multi-user.target.wants/sftp.service':
		ensure => 'link',
		target => '/lib/systemd/system/sftp.service',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['sftp'],
	}

}
