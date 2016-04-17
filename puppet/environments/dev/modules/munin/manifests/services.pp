class munin::services inherits munin {

	service {'munin-node':
		ensure => 'running',
		enable  => 'true',
		hasrestart => 'true',
		require => Package['munin-node'],
	}

}
