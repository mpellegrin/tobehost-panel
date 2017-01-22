class tobehost::web::config inherits tobehost::web {

	file {'/etc/apache2/mods-available/fcgid.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['apache2'],
		source => 'puppet:///modules/tobehost/web/apache/mods-available/fcgid.conf',
	}

	file {'/etc/php5/cgi/php.ini':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['apache2'],
		source => 'puppet:///modules/tobehost/web/php/cgi/php.ini',
	}

	file { '/etc/apache2/sites-available/default.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['apache2'],
		source => 'puppet:///modules/tobehost/web/apache/sites-available/default.conf',
	}

	file { '/etc/apache2/sites-enabled/000-default.conf':
		ensure => 'link',
		mode   => '777',
		group  => '0',
		owner  => '0',
		notify => Service['apache2'],
		target => '../sites-available/default.conf',
	}

	file { '/etc/apache2/mods-enabled/actions.conf':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/actions.conf',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/actions.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/actions.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/auth_digest.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/auth_digest.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/dav.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/dav.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/dav_fs.conf':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/dav_fs.conf',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/dav_fs.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/dav_fs.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/include.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/include.load',
		notify => Service['apache2'],
	}

#	file { '/etc/apache2/mods-enabled/ruby.load':
#		ensure => 'link',
#		group  => '0',
#		mode   => '777',
#		owner  => '0',
#		target => '../mods-available/ruby.load',
#		notify => Service['apache2'],
#	}

	file { '/etc/apache2/mods-enabled/ssl.conf':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/ssl.conf',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/ssl.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/ssl.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/socache_shmcb.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/socache_shmcb.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/suexec.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/suexec.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/rewrite.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/rewrite.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/headers.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/headers.load',
		notify => Service['apache2'],
	}

#	file { '/etc/apache2/mods-available/ssl.conf':
#		ensure => 'file',
#		group  => '0',
#		mode   => '644',
#		owner  => '0',
#		source => 'puppet:///modules/tobehost/web/apache/mods-available/ssl.conf',
#		notify => Service['apache2'],
#	}

	file { '/etc/apache2/mods-enabled/proxy.load':
		ensure => 'link',
		group  => '0',
		owner  => '0',
		target => '../mods-available/proxy.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/proxy.conf':
		ensure => 'link',
		group  => '0',
		owner  => '0',
		target => '../mods-available/proxy.conf',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/proxy_http.load':
		ensure => 'link',
		group  => '0',
		owner  => '0',
		target => '../mods-available/proxy_http.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/expires.load':
		ensure => 'link',
		group  => '0',
		owner  => '0',
		target => '../mods-available/expires.load',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/fcgid.conf':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/fcgid.conf',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/fcgid.load':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/fcgid.load',
		notify => Service['apache2'],
	}

	file { '/var/www/index.html':
		ensure => 'file',
		group  => '0',
		owner  => '0',
		mode   => '644',
		source => 'puppet:///modules/tobehost/web/apache/default-index.html',
		notify => Service['apache2'],
	}


	# FastCGI
	file {'/var/www/fcgi-scripts/':
		ensure => 'directory',
		owner => 'root',
		group => 'root',
		mode => '755',
	}

	#PHPMyAdmin
	group {'phpmyadmin':
		ensure => 'present',
	}
	user { 'phpmyadmin':
		ensure  => 'present',
		gid     => 'phpmyadmin',
		groups  => ['www-data'],
		membership => 'inclusive',
		home    => '/usr/share/phpmyadmin',
		shell   => '/bin/false',
		managehome => false,
	}
	file {'/etc/apache2/conf.d/phpmyadmin.conf':
		ensure => 'absent',
		notify => Service['apache2'],
	}
	file {'/etc/apache2/sites-available/phpmyadmin.conf':
		ensure => 'file',
		owner  => '0',
		group  => '0',
		mode   => '644',
		source => 'puppet:///modules/tobehost/web/apache/sites-available/phpmyadmin.conf',
		notify => Service['apache2'],
	}
	file {'/etc/apache2/sites-enabled/010-phpmyadmin.conf':
		ensure => 'link',
		target => '../sites-available/phpmyadmin.conf',
		notify => Service['apache2'],
	}
	file {'/var/www/fcgi-scripts/phpmyadmin':
		ensure => 'directory',
		owner => 'phpmyadmin',
		group => 'phpmyadmin',
		mode   => '644',
		notify => Service['apache2'],
	}
	file {'/var/www/fcgi-scripts/phpmyadmin/php-fcgi-starter':
		ensure => 'file',
		owner => 'phpmyadmin',
		group => 'phpmyadmin',
		mode   => '755',
		source => 'puppet:///modules/tobehost/web/phpmyadmin/php-fcgi-starter',
		notify => Service['apache2'],
	}
	file {'/etc/phpmyadmin/conf.d/tobehost.inc.php':
		ensure => 'file',
		owner => 'root',
		group => 'www-data',
		mode   => '644',
		source => 'puppet:///modules/tobehost/web/phpmyadmin/config-local.inc.php',
		notify => Service['apache2'],
	}
	file {'/var/lib/phpmyadmin/tmp':
		ensure => 'directory',
		owner => 'phpmyadmin',
		group => 'www-data',
		mode   => '750',
		notify => Service['apache2'],
	}

	# Panel
	file { '/usr/local/share/tobehost_panel':
		ensure => 'directory',
		owner => 'root',
		group => 'tobehost_panel',
		mode => 750,
		#source => 'puppet:///modules/tobehost/web/tobehost_panel/share/',
		#recurse => true,
		#purge => true,
		#force => true,
		#recurselimit => 3,
		require => User['tobehost_panel'],
	}

	file { "/etc/apache2/sites-available/tobehost_panel.conf":
		ensure => 'file',
		source => 'puppet:///modules/tobehost/web/apache/sites-available/tobehost_panel.conf',
		notify => Service['apache2'],
		owner => 'root',
		group => 'root',
		mode => '644',
	}

	file { "/etc/apache2/sites-enabled/010-tobehost_panel.conf":
		ensure => 'link',
		target => "../sites-available/tobehost_panel.conf",
		notify => Service['apache2'],
	}

	file { "/var/www/fcgi-scripts/tobehost_panel":
		ensure => 'directory',
		owner => 'tobehost_panel',
		group => 'tobehost_panel',
		mode => '550',
		require => User['tobehost_panel'],
	}

	file { "/var/www/fcgi-scripts/tobehost_panel/php-fcgi-starter":
		ensure => 'file',
		owner => 'tobehost_panel',
		group => 'tobehost_panel',
		mode => '550',
		source => 'puppet:///modules/tobehost/web/tobehost_panel/php-fcgi-starter',
		require => User['tobehost_panel'],
	}

	file {'/data/web':
		ensure => 'directory',
		owner  => 'root',
		group  => 'root',
		mode   => '755',
	}

	/* ---- */

	define tobehost_apache_enable($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${hostname}"
		$domain_docroot = "/data/web/${domain_name}"
		$apache_docroot = "/data/web/${domain_name}/www"
		$apache_logdir = "/data/web/${domain_name}/logs"
		$php_tmpdir = "/data/web/${domain_name}/tmp"
		$apache_domain = $domain_name
		$apache_suexec_user = "${entity_id}_${tbh_web_id}"
		$apache_suexec_group = "${entity_id}_${tbh_web_id}"

		file { $domain_docroot:
			ensure => 'directory',
			owner  => 'root',
			group  => 'www-data',
			mode   => '550',
		}

		file { "/etc/apache2/sites-available/${domain_name}.conf":
			ensure => 'file',
			content => template('tobehost/web/apache_user_vhost_enabled.conf.erb'),
			#require => User[$unix_username],
			#require => [User[$unix_username], File["/data/web/${domain_name}"]],
			require => File["/data/web/${domain_name}"],
			notify => Service['apache2'],
		}

		file { "/etc/apache2/sites-enabled/100-${domain_name}.conf":
			ensure => 'link',
			target => "../sites-available/${domain_name}.conf",
			#require => User[$unix_username],
			#require => [User[$unix_username], File["/data/web/${domain_name}"]],
			require => File["/data/web/${domain_name}"],
			notify => Service['apache2'],
		}

		file { $apache_docroot:
			ensure => 'directory',
			owner => $unix_username,
			group => $unix_username,
			mode => '750',
			#require => User[$unix_username],
			#require => [User[$unix_username], File["/data/web/${domain_name}"]],
			require => File["/data/web/${domain_name}"],
		}

		file { $apache_logdir:
			ensure => 'directory',
			owner => $unix_username,
			group => $unix_username,
			mode => '770',
			#require => User[$unix_username],
			#require => [User[$unix_username], File["/data/web/${domain_name}"]],
			require => File["/data/web/${domain_name}"],
		}

		file { $php_tmpdir:
			ensure => 'directory',
			owner => $unix_username,
			group => $unix_username,
			mode => '750',
			#require => User[$unix_username],
			#require => [User[$unix_username], File["/data/web/${domain_name}"]],
			require => File["/data/web/${domain_name}"],
		}

		if ($tbh_web_php) {
			file { "/var/www/fcgi-scripts/$apache_suexec_user":
				ensure => 'directory',
				owner => $apache_suexec_user,
				group => $apache_suexec_group,
				mode => '550',
				#require => User[$unix_username],
				#require => [User[$unix_username], File["/data/web/${domain_name}"]],
				require => File["/data/web/${domain_name}"],
			}

			file { "/var/www/fcgi-scripts/$apache_suexec_user/php-fcgi-starter":
				ensure => 'file',
				owner => $apache_suexec_user,
				group => $apache_suexec_group,
				mode => '550',
				content => template('tobehost/web/php-fcgi-starter.erb'),
				#require => User[$unix_username],
				#require => [User[$unix_username], File["/data/web/${domain_name}"]],
				require => File["/data/web/${domain_name}"],
			}
		}

		/*
		file { "/data/home/$unix_username/$domain_name":
			ensure => 'link',
			owner => 'root',
			group => 'root',
			mode => '550',
			target => "/data/web/${domain_name}",
			#require => User[$unix_username],
			#require => [User[$unix_username], File["/data/web/${domain_name}"]],
			require => [File["/data/home/${unix_username}"], File["/data/web/${domain_name}"]],
		}
		*/
	}

	define tobehost_apache_disable($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${hostname}"
		$apache_docroot = "/data/web/${domain_name}/www"
		$apache_logdir = "/data/web/${domain_name}/logs"
		$php_tmpdir = "/data/web/${domain_name}/tmp"
		$apache_domain = $domain_name
		$apache_suexec_user = "${entity_id}_${tbh_web_id}"
		$apache_suexec_group = "${entity_id}_${tbh_web_id}"

		file { $domain_docroot:
			ensure => 'directory',
			owner  => 'root',
			group  => 'www-data',
			mode   => '550',
		}

		file { "/etc/apache2/sites-available/${domain_name}.conf":
			ensure => 'file',
			content => template('tobehost/web/apache_user_vhost_disabled.conf.erb'),
			require => User[$unix_username],
			notify => Service['apache2'],
		}

		file { "/etc/apache2/sites-enabled/100-${domain_name}.conf":
			ensure => 'absent',
			#target => "../sites-available/${domain_name}.conf",
			#require => User[$unix_username],
			notify => Service['apache2'],
		}

		file { $apache_docroot:
			ensure => 'directory',
			owner => $unix_username,
			group => $unix_username,
			mode => '750',
			require => User[$unix_username],
		}

		file { $apache_logdir:
			ensure => 'directory',
			owner => $unix_username,
			group => $unix_username,
			mode => '770',
			require => User[$unix_username],
		}

		file { $php_tmpdir:
			ensure => 'directory',
			owner => $unix_username,
			group => $unix_username,
			mode => '750',
			require => User[$unix_username],
		}

		file { "/var/www/fcgi-scripts/$apache_suexec_user":
			ensure => 'directory',
			owner => $apache_suexec_user,
			group => $apache_suexec_group,
			mode => '550',
			require => User[$unix_username],
		}

		file { "/var/www/fcgi-scripts/$apache_suexec_user/php-fcgi-starter":
			ensure => 'file',
			owner => $apache_suexec_user,
			group => $apache_suexec_group,
			mode => '550',
			content => template('tobehost/web/php-fcgi-starter.erb'),
			require => User[$unix_username],
		}

		/*
		file { "/data/home/$unix_username/$domain_name":
			ensure => 'absent',
			require => [File["/data/home/${unix_username}"], File["/data/web/${domain_name}"]],
		}
		*/
	}

	define tobehost_apache_delete($entity_id, $tbh_web_id, $tbh_web_php, $tbh_ftp_password) {

		$domain_name = "${tbh_web_id}.${hostname}"
		$apache_docroot = "/data/web/${domain_name}/www"
		$apache_logdir = "/data/web/${domain_name}/logs"
		$php_tmpdir = "/data/web/${domain_name}/tmp"
		$apache_domain = $domain_name
		$apache_suexec_user = "${entity_id}_${tbh_web_id}"
		$apache_suexec_group = "${entity_id}_${tbh_web_id}"

		file { "/etc/apache2/sites-available/${domain_name}.conf":
			ensure => 'absent',
			notify => Service['apache2'],
		}

		file { "/etc/apache2/sites-enabled/100-${domain_name}.conf":
			ensure => 'absent',
			notify => Service['apache2'],
		}

		file { $domain_docroot:
			ensure => 'absent',
		}

		file { $apache_docroot:
			ensure => 'absent',
		}

		file { $apache_logdir:
			ensure => 'absent',
		}

		file { $php_tmpdir:
			ensure => 'absent',
		}

		file { "/var/www/fcgi-scripts/$apache_suexec_user":
			ensure => 'absent',
		}

		file { "/var/www/fcgi-scripts/$apache_suexec_user/php-fcgi-starter":
			ensure => 'absent',
		}

		/*
		file { "/data/home/$unix_username/$domain_name":
			ensure => 'absent',
		}
		*/

	}

	$web_active = hiera('web-active')
	create_resources(tobehost_apache_enable, $web_active)

	$web_disabled = hiera('web-disabled')
	create_resources(tobehost_apache_disable, $web_disabled)

	$web_deleted = hiera('web-deleted')
	create_resources(tobehost_apache_delete, $web_deleted)
}
