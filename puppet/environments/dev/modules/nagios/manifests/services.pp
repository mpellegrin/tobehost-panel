class nagios::services inherits nagios {

	service {'nagios-nrpe-server':
		ensure => 'running',
		enable  => 'true',
		hasrestart => 'true',
		require => Package['nagios-nrpe-server'],
	}

}
