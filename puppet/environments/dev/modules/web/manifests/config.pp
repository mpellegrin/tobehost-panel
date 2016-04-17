class web::config inherits web {

	file {'/etc/apache2/mods-available/fcgid.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['apache2'],
		source => 'puppet:///modules/web/apache/mods-available/fcgid.conf',
	}

	file {'/etc/php5/cgi/php.ini':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['apache2'],
		source => 'puppet:///modules/web/php/cgi/php.ini',
	}

	file { '/etc/apache2/sites-available/default.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		notify => Service['apache2'],
		source => 'puppet:///modules/web/apache/sites-available/default.conf',
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
#		source => 'puppet:///modules/web/apache/mods-available/ssl.conf',
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
		source => 'puppet:///modules/web/apache/default-index.html',
		notify => Service['apache2'],
	}



	# Monitoring
	file { '/etc/munin/plugins/apache_accesses':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/apache_accesses',
		notify => Service['munin-node'],
	}

	file { '/etc/munin/plugins/apache_processes':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/apache_processes',
		notify => Service['munin-node'],
	}

	file { '/etc/munin/plugins/apache_volume':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/apache_volume',
		notify => Service['munin-node'],
	}

	file { '/usr/local/lib/nagios/plugins/check_vhosts':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '755',
		source => 'puppet:///modules/web/nagios/plugins_bin/check_vhosts',
	}

	file { '/etc/nagios/nrpe.d/check_vhosts.cfg':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '644',
		content => 'command[check_vhosts]=/usr/local/lib/nagios/plugins/check_vhosts',
		require => Package['nagios-nrpe-server'],
		notify => Service['nagios-nrpe-server'],
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
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.key',
	}

	file {'/etc/ssl/tobehost/tobehost.crt':
		ensure => 'file',
		mode => 444,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.crt',
	}

	file {'/etc/ssl/tobehost/tobehost.pem':
		ensure => 'file',
		mode => 440,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.pem',
	}

	file {'/etc/ssl/tobehost/tobehost.ca-bundle':
		ensure => 'file',
		mode => 444,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.ca-bundle',
	}
*/

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
		source => 'puppet:///modules/web/apache/sites-available/phpmyadmin.conf',
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
		source => 'puppet:///modules/web/phpmyadmin/php-fcgi-starter',
		notify => Service['apache2'],
	}
	file {'/etc/phpmyadmin/conf.d/tobehost.inc.php':
		ensure => 'file',
		owner => 'root',
		group => 'www-data',
		mode   => '644',
		source => 'puppet:///modules/web/phpmyadmin/config-local.inc.php',
		notify => Service['apache2'],
	}
	file {'/var/lib/phpmyadmin/tmp':
		ensure => 'directory',
		owner => 'phpmyadmin',
		group => 'www-data',
		mode   => '750',
		notify => Service['apache2'],
	}

}
