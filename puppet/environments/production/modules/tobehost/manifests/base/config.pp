class tobehost::base::config inherits tobehost::base {

	/*
	file { '/etc/hostname':
		ensure  => 'file',
		content => $hostname,
		group   => '0',
		mode    => '644',
		owner   => '0',
	}
	*/

	file {'/etc/cron.d/tobehost_panel':
		ensure  => 'file',
		content => '*/10 * * * *  root  [ -x /usr/local/sbin/tobehost_panel_cron ] && /usr/local/sbin/tobehost_panel_cron',
		owner   => '0',
		group   => '0',
		mode    => '644',
	}
	file {'/usr/local/sbin/tobehost_panel_cron':
		ensure => 'file',
		source => 'puppet:///modules/tobehost/base/cron.d/tobehost_panel',
		owner  => '0',
		group  => '0',
		mode   => '750',
	}

}
