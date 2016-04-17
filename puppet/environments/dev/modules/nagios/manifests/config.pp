class nagios::config inherits nagios {

	file {'/etc/nagios/nrpe.cfg':
		ensure => 'file',
		mode   => '644',
		group  => 'root',
		owner  => 'root',
		require => Package['nagios-nrpe-server'],
		notify  => Service['nagios-nrpe-server'],  # this sets up the relationship
		content => template('nagios/nrpe.cfg.erb'),
	}

	file { '/etc/nagios/nrpe.d/check_apt.cfg':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '644',
		content => 'command[check_apt]=/usr/lib/nagios/plugins/check_apt -c "nothing"',
		require => Package['nagios-nrpe-server'],
		notify => Service['nagios-nrpe-server'],
	}

}
