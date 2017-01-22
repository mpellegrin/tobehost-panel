class tobehost::ftp::config inherits tobehost::ftp {

	file { '/etc/vsftpd.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['vsftpd'],
		source => 'puppet:///modules/tobehost/ftp/vsftpd/vsftpd.conf',
	}

	file { '/etc/ssh/sftp.conf':
		ensure => 'file',
		mode   => '600',
		group  => '0',
		owner  => '0',
		notify => Service['sftp'],
		content => template('tobehost/ftp/sftp/sshd_config.erb'),
	}

	file { '/lib/systemd/system/sftp.service':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['sftp'],
		source => 'puppet:///modules/tobehost/ftp/systemd/sftp.service',
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
 

	define tobehost_ftp_enable($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${tobehost::hosting_domain}"
		$ftp_docroot = "/data/web/${domain_name}"
		$ftp_user = "${entity_id}_${tbh_web_id}"
		$ftp_group = "${entity_id}_${tbh_web_id}"
		$ftp_password = inline_template("<%= '${tbh_ftp_password}'.crypt('\$6$') %>")

		user { $ftp_user:
			ensure => 'present',
			password => $ftp_password,
			home   => $ftp_docroot,
			managehome => false,
			shell      => '/bin/sh',
		}

	}

	define tobehost_ftp_disable($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${tobehost::hosting_domain}"
		$ftp_docroot = "/data/web/${domain_name}"
		$ftp_user = "${entity_id}_${tbh_web_id}"
		$ftp_group = "${entity_id}_${tbh_web_id}"
		$ftp_password = $tbh_ftp_password

		user { $ftp_user:
			ensure => 'present',
			password => '!',
			home   => $ftp_docroot,
			managehome => false,
			shell      => '/bin/false',
		}

	}

	define tobehost_ftp_delete($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${tobehost::hosting_domain}"
		$ftp_docroot = "/data/web/${domain_name}"
		$ftp_user = "${entity_id}_${tbh_web_id}"
		$ftp_group = "${entity_id}_${tbh_web_id}"
		$ftp_password = $tbh_ftp_password

		user { $ftp_user:
			ensure => 'absent',
		}

	}

	$web_active = hiera('web-active')
	create_resources(tobehost_ftp_enable, $web_active)

	$web_disabled = hiera('web-disabled')
	create_resources(tobehost_ftp_disable, $web_disabled)

	$web_deleted = hiera('web-deleted')
	create_resources(tobehost_ftp_delete, $web_deleted)

}
