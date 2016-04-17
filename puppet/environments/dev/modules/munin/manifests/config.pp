class munin::config inherits munin {

	# add a notify to the file resource
	file { '/etc/munin/munin-node.conf':
		ensure => 'file',
		notify  => Service['munin-node'],
		mode	=> 644,
		owner   => 'root',
		group   => 'root',
		require => Package['munin-node'],
		content => template('munin/munin-node.conf.erb'),
	}

	if $tls == true {
		file { '/etc/ssl/munin':
			ensure => 'directory',
			owner  => 'root',
			group  => 'munin',
			mode   => '750',
			notify  => Service['munin-node'],
			require => Package['munin-node'],
		}

		file { '/etc/ssl/munin/ca.crt':
			ensure => 'present',
			owner  => 'root',
			group  => 'munin',
			mode   => '640',
			source => 'puppet:///modules/munin/ssl/ca.crt',
			notify  => Service['munin-node'],
			require => Package['munin-node'],
		}

		file { "/etc/ssl/munin/$hostname.key":
			ensure => 'present',
			owner  => 'root',
			group  => 'munin',
			mode   => '640',
			source => "puppet:///modules/munin/ssl/$hostname.key",
			notify  => Service['munin-node'],
			require => Package['munin-node'],
		}

		file { "/etc/ssl/munin/$hostname.crt":
			ensure => 'present',
			owner  => 'root',
			group  => 'munin',
			mode   => '640',
			source => "puppet:///modules/munin/ssl/$hostname.crt",
			notify  => Service['munin-node'],
			require => Package['munin-node'],
		}

		file { "/etc/ssl/certs/munin-selfsigned-ca.crt":
			ensure => 'link',
			owner  => 'root',
			group  => 'root',
			mode   => '644',
			target => '/etc/ssl/munin/ca.crt',
			notify  => Service['munin-node'],
			require => Package['munin-node'],
		}
	}

}
