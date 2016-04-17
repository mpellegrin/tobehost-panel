class base::config inherits base {

	# Disable buggy IPv6 autoconf
	file { '/etc/sysctl.d/10-ipv6fix.conf':
		ensure  => 'file',
		#source => 'puppet:///modules/base/sysctl.d/10-ipv6fix.conf',
		content => template('base/sysctl.d/10-ipv6fix.conf.erb'),
		owner   => '0',
		group   => '0',
		mode    => '644',
	}

	if $datacenter_owner == 'ovh' {
		file { '/etc/apt/sources.list':
			ensure  => 'file',
			source => 'puppet:///modules/base/sources.list.ovh',
			group   => '0',
			mode    => '644',
			owner   => '0',
		}
	} elsif $datacenter_owner == 'online' {
		file { '/etc/apt/sources.list':
			ensure  => 'file',
			source => 'puppet:///modules/base/sources.list.online',
			group   => '0',
			mode    => '644',
			owner   => '0',
		}
	} else {
		file { '/etc/apt/sources.list':
			ensure  => 'file',
			source => 'puppet:///modules/base/sources.list.generic',
			group   => '0',
			mode    => '644',
			owner   => '0',
		}
	}

	# SSH configuration
#	file { '/etc/ssh/sshd_config':
#		ensure => 'file',
#		notify  => Service['ssh'],
#		mode	=> 600,
#		owner   => 'root',
#		group   => 'root',
#		require => Package['openssh-server'],
#		content => template('base/ssh/sshd_config.erb'),
#	}
	# Shown before login
#	file { '/etc/issue.net':
#		ensure  => 'file',
#		source => 'puppet:///modules/base/issue.net',
#		group   => '0',
#		mode    => '644',
#		owner   => '0',
#	}
	# Shown after login
#	file { '/etc/motd':
#		ensure  => 'file',
#		content => template('base/motd'),
#		group   => '0',
#		mode    => '644',
#		owner   => '0',
#	}


	# Enforcing DNS resolution
#	file { '/etc/resolv.conf':
#		ensure  => 'file',
#		source => 'puppet:///modules/base/resolv.conf',
#		group   => '0',
#		mode    => '644',
#		owner   => '0',
#	}

	file { '/etc/hostname':
		ensure  => 'file',
		content => $hostname,
		group   => '0',
		mode    => '644',
		owner   => '0',
	}

	file { '/etc/hosts':
		ensure  => 'file',
		content => template("base/hosts.erb"),
		group   => '0',
		mode    => '644',
		owner   => '0',
	}

	# Firewall handled by iptables-permanent
	file { '/etc/iptables/rules.v4':
		ensure  => 'file',
		content => template("base/iptables/rules.v4"),
		owner   => '0',
		group   => '0',
		mode    => '750',
	}
	file { '/etc/iptables/rules.v6':
		ensure  => 'file',
		content => template("base/iptables/rules.v6"),
		owner   => '0',
		group   => '0',
		mode    => '750',
	}

	# Done by Postfix configuration
#	file { '/etc/mailname':
#		ensure  => 'file',
#		content => $hostname,
#		group   => '0',
#		mode    => '644',
#		owner   => '0',
#	}

	# Enforcing Network configuration (was a very bad idea)
#	file { '/etc/network/interfaces':
#		notify => Service["networking"],
#		content => template("network/interfaces_${interfaces_type}.erb"),
#	}


}
