class dns::tobehost::config inherits dns::tobehost {

	file { '/etc/bind/zones.tobehost':
		ensure => 'directory',
		mode => '755',
		owner => 'root',
		group => 'root',
	}

	file { '/etc/bind/zones.tobehost/services':
		ensure => 'file',
		owner => 'root',
		group => 'root',
		mode => '644',
		content => template('dns/zones/services'),
		notify => Service['bind9'],
	}

	file { '/etc/bind/zones.tobehost/pri.phpmyadmin':
		ensure => 'file',
		owner => 'root',
		group => 'root',
		mode => '755',
		content => template('dns/zones/pri.phpmyadmin.erb'),
		notify => Service['bind9'],
	}

	file { '/etc/bind/zones.tobehost/pri.tobehost':
		ensure => 'file',
		owner => 'root',
		group => 'root',
		mode => '755',
		content => template('dns/zones/pri.tobehost.erb'),
		notify => Service['bind9'],
	}

	concat { '/etc/bind/zones.tobehost/hosted':
		owner  => 'root',
		group  => 'root',
		mode   => '644',
		notify => Service['bind9'],
	}

	define tobehost_bind_enable($unix_username, $domain_name) {

		file { "/etc/bind/zones.tobehost/pri.${domain_name}":
			ensure => 'file',
			mode => '755',
			owner => 'root',
			group => 'root',
			content => template('dns/pri.zone.hosted.erb'),
			notify => Service['bind9'],
		}

		concat::fragment { "${domain_name}":
			target  => '/etc/bind/zones.tobehost/hosted',
			content => template('dns/zone.hosted.erb'),
		}

	}

	define tobehost_bind_disable($unix_username, $domain_name) {

		file { "/etc/bind/zones.tobehost/pri.${domain_name}":
			ensure => 'absent',
			notify => Service['bind9'],
		}

	}

	define tobehost_bind_delete($unix_username, $domain_name) {

		file { "/etc/bind/zones.tobehost/pri.${domain_name}":
			ensure => 'absent',
			notify => Service['bind9'],
		}

	}

	$web_active = hiera('active-web')
	#notify{"The value is: ${web_active}": }
	create_resources(tobehost_bind_enable, $web_active)

	$web_disabled = hiera('disabled-web')
	#notify{"The value is: ${web_disabled}": }
	create_resources(tobehost_bind_disable, $web_disabled)

	$web_deleted = hiera('deleted-web')
	#notify{"The value is: ${web_deleted}": }
	create_resources(tobehost_bind_delete, $web_deleted)

}
