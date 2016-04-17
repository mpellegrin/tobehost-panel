class ftp::config inherits ftp {

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

	# SSL Certs
	/*
	file {'/etc/ssl/tobehost':
		ensure => 'directory',
		mode => 550,
		owner => 'root',
		group => 'ssl-cert',
	}
	file {'/etc/ssl/tobehost/tobehost.key':
		ensure => 'file',
		mode => 440,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost.key',
	}
	file {'/etc/ssl/tobehost/tobehost.crt':
		ensure => 'file',
		mode => 444,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost.crt',
	}
	file {'/etc/ssl/tobehost/tobehost.pem':
		ensure => 'file',
		mode => 440,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost.pem',
	}
	file {'/etc/ssl/tobehost/tobehost.ca-bundle':
		ensure => 'file',
		mode => 444,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost.ca-bundle',
	}
	*/
}
