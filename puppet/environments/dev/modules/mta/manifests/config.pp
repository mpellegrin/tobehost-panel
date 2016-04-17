class mta::config inherits mta {

	file { '/etc/nagios/nrpe.d/check_exim_queue.cfg':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '644',
		content => 'command[check_exim_queue]=/usr/lib/nagios/plugins/check_mailq -w 20 -c 40 -M exim',
		require => Package['nagios-nrpe-server'],
		notify => Service['nagios-nrpe-server'],
	}

	file { '/etc/nagios/nrpe.d/check_local_smtp.cfg':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '644',
		content => 'command[check_local_smtp]=/usr/lib/nagios/plugins/check_smtp -H localhost',
		require => Package['nagios-nrpe-server'],
		notify => Service['nagios-nrpe-server'],
	}

	user {'nagios':
		groups => 'Debian-exim',
	}

}
