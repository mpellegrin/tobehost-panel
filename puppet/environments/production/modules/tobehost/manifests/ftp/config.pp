class tobehost::ftp::config inherits tobehost::ftp {

	file { '/etc/vsftpd.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['vsftpd'],
		source => 'puppet:///modules/tobehost/ftp/vsftpd/vsftpd.conf',
	}

	define tobehost_ftp_enable($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${hostname}"
		$ftp_docroot = "/data/web/${domain_name}"
		$ftp_user = "${entity_id}_${tbh_web_id}"
		$ftp_group = "${entity_id}_${tbh_web_id}"
		$ftp_password = $tbh_ftp_password

		user { $ftp_user:
			ensure => 'present',
			password => $ftp_password,
			gid    => $ftp_group,
			home   => $ftp_docroot,
			managehome => false,
			shell      => '/dev/null',
		}

	}

	define tobehost_ftp_disable($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${hostname}"
		$ftp_docroot = "/data/web/${domain_name}"
		$ftp_user = "${entity_id}_${tbh_web_id}"
		$ftp_group = "${entity_id}_${tbh_web_id}"
		$ftp_password = $tbh_ftp_password

		user { $ftp_user:
			ensure => 'present',
			password => '!',
			gid    => $ftp_group,
			home   => $ftp_docroot,
			managehome => false,
			shell      => '/dev/null',
		}

	}

	define tobehost_ftp_delete($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${hostname}"
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
