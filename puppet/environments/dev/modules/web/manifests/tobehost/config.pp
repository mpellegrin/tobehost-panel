class web::tobehost::config inherits web::tobehost {

	file { '/usr/local/share/tobehost_panel':
		ensure => 'directory',
		owner => 'root',
		group => 'tobehost_panel',
		mode => 750,
		#source => 'puppet:///modules/web/tobehost_panel/share/',
		#recurse => true,
		#purge => true,
		#force => true,
		#recurselimit => 3,
		require => User['tobehost_panel'],
	}

	file { "/etc/apache2/sites-available/tobehost_panel.conf":
		ensure => 'file',
		source => 'puppet:///modules/web/apache/sites-available/tobehost_panel.conf',
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
		source => 'puppet:///modules/web/tobehost_panel/php-fcgi-starter',
		require => User['tobehost_panel'],
	}

	/* ---- */

	define tobehost_apache_enable($unix_username, $domain_name) {

		$apache_docroot = "/data/web/${domain_name}/www"
		$apache_logdir = "/data/web/${domain_name}/logs"
		$php_tmpdir = "/data/web/${domain_name}/tmp"
		$apache_domain = $domain_name
		$apache_suexec_user = $unix_username
		$apache_suexec_group = $unix_username

		file { "/etc/apache2/sites-available/${domain_name}.conf":
			ensure => 'file',
			content => template('web/apache_user_vhost_enabled.conf.erb'),
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
			content => template('web/php-fcgi-starter.erb'),
			#require => User[$unix_username],
			#require => [User[$unix_username], File["/data/web/${domain_name}"]],
			require => File["/data/web/${domain_name}"],
		}

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
	}

	define tobehost_apache_disable($unix_username, $domain_name) {

		$apache_docroot = "/data/web/${domain_name}/www"
		$apache_logdir = "/data/web/${domain_name}/logs"
		$php_tmpdir = "/data/web/${domain_name}/tmp"
		$apache_domain = $domain_name
		$apache_suexec_user = $unix_username
		$apache_suexec_group = $unix_username

		file { "/etc/apache2/sites-available/${domain_name}.conf":
			ensure => 'file',
			content => template('web/apache_user_vhost_disabled.conf.erb'),
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
			content => template('web/php-fcgi-starter.erb'),
			require => User[$unix_username],
		}

		file { "/data/home/$unix_username/$domain_name":
			ensure => 'absent',
			require => [File["/data/home/${unix_username}"], File["/data/web/${domain_name}"]],
		}
	}

	define tobehost_apache_delete($unix_username, $domain_name) {

		$apache_docroot = "/data/web/${domain_name}/www"
		$apache_logdir = "/data/web/${domain_name}/logs"
		$php_tmpdir = "/data/web/${domain_name}/tmp"
		$apache_domain = $domain_name
		$apache_suexec_user = $unix_username
		$apache_suexec_group = $unix_username

		file { "/etc/apache2/sites-available/${domain_name}.conf":
			ensure => 'absent',
			notify => Service['apache2'],
		}

		file { "/etc/apache2/sites-enabled/100-${domain_name}.conf":
			ensure => 'absent',
			notify => Service['apache2'],
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

		file { "/data/home/$unix_username/$domain_name":
			ensure => 'absent',
		}

	}

	$web_active = hiera('active-web')
	#notify{"The value is: ${web_active}": }
	create_resources(tobehost_apache_enable, $web_active)

	$web_disabled = hiera('disabled-web')
	#notify{"The value is: ${web_disabled}": }
	create_resources(tobehost_apache_disable, $web_disabled)

	$web_deleted = hiera('deleted-web')
	#notify{"The value is: ${web_deleted}": }
	create_resources(tobehost_apache_delete, $web_deleted)


}
