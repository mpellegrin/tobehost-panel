class munin::plugins::ping inherits munin::plugins {

	# New "ping" plugin
	file { '/usr/share/munin/plugins/ping+_':
		ensure => 'file',
		group  => '0',
		mode   => '755',
		owner  => '0',
		source => 'puppet:///modules/munin/usr-share-plugins/ping+_',
		notify => Service['munin-node'],
		require => Package['munin-node'],
	}

	# Old "ping" plugin
	file { '/etc/munin/plugins/ping_ipv4.google.com':
		ensure => 'absent',
		notify => Service['munin-node'],
		require => Package['munin-node'],
	}
	file { '/etc/munin/plugins/ping6_ipv6.google.com':
		ensure => 'absent',
		notify => Service['munin-node'],
		require => Package['munin-node'],
	}

	if $datacenter_owner == 'ovh' {
		# "ping" plugin
		file { '/etc/munin/plugins/ping_ipv4.sbg.proof.ovh.net':
			ensure => 'link',
			group  => '0',
			mode   => '777',
			owner  => '0',
			target => '/usr/share/munin/plugins/ping+_',
			notify => Service['munin-node'],
			require => Package['munin-node'],
		}

		# "ping" plugin
		file { '/etc/munin/plugins/ping6_ipv6.sbg.proof.ovh.net':
			ensure => 'link',
			group  => '0',
			mode   => '777',
			owner  => '0',
			target => '/usr/share/munin/plugins/ping+_',
			notify => Service['munin-node'],
			require => Package['munin-node'],
		}
	} elsif $datacenter_owner == 'online' {
		# "ping" plugin
		file { '/etc/munin/plugins/ping_ping.online.net':
			ensure => 'link',
			group  => '0',
			mode   => '777',
			owner  => '0',
			target => '/usr/share/munin/plugins/ping+_',
			notify => Service['munin-node'],
			require => Package['munin-node'],
		}

		# "ping" plugin
		file { '/etc/munin/plugins/ping6_ping6.online.net':
			ensure => 'link',
			group  => '0',
			mode   => '777',
			owner  => '0',
			target => '/usr/share/munin/plugins/ping+_',
			notify => Service['munin-node'],
			require => Package['munin-node'],
		}
	}

	# "ping" plugin configuration
	file { '/etc/munin/plugin-conf.d/ping_':
		ensure => 'present',
		group  => '0',
		mode   => '644',
		owner  => '0',
		source => 'puppet:///modules/munin/plugin-conf.d/ping_',
		notify => Service['munin-node'],
		require => Package['munin-node'],
	}

}
