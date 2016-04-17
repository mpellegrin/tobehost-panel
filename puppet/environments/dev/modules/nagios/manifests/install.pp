class nagios::install inherits nagios {

	package {'nagios-nrpe-server':
		ensure => 'present',
	}

	package {'nagios-plugins':
		ensure => 'present',
	}

	file { '/usr/local/lib/nagios':
		ensure => 'directory',
		owner  => 'root',
		group  => 'root',
		mode   => '755',
	}

	file { '/usr/local/lib/nagios/plugins':
		ensure => 'directory',
		owner  => 'root',
		group  => 'root',
		mode   => '755',
	}

}
