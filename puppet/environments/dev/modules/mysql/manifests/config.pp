class mysql::config inherits mysql {

/*
	file { '/etc/ssl/mysql':
		ensure => 'directory',
		owner  => 'root',
		group  => 'mysql',
		mode   => '750',
		notify  => Service['mysql'],  # this sets up the relationship
	}

	file { '/etc/ssl/mysql/ca.crt':
		ensure => 'present',
		owner  => 'root',
		group  => 'mysql',
		mode   => '644',
		source => "puppet:///modules/mysql/ssl/ca.crt",
		notify  => Service['mysql'],  # this sets up the relationship
	}

	file { '/etc/ssl/mysql/server.key':
		ensure => 'present',
		owner  => 'root',
		group  => 'mysql',
		mode   => '640',
		source => "puppet:///modules/mysql/ssl/${shortname}_server.key",
		notify  => Service['mysql'],  # this sets up the relationship
	}

	file { '/etc/ssl/mysql/server.crt':
		ensure => 'present',
		owner  => 'root',
		group  => 'mysql',
		mode   => '644',
		source => "puppet:///modules/mysql/ssl/${shortname}_server.crt",
		notify  => Service['mysql'],  # this sets up the relationship
	}

	file { '/etc/ssl/mysql/client.key':
		ensure => 'present',
		owner  => 'root',
		group  => 'mysql',
		mode   => '640',
		source => "puppet:///modules/mysql/ssl/${shortname}_client.key",
		notify  => Service['mysql'],  # this sets up the relationship
	}

	file { '/etc/ssl/mysql/client.crt':
		ensure => 'present',
		owner  => 'root',
		group  => 'mysql',
		mode   => '644',
		source => "puppet:///modules/mysql/ssl/${shortname}_client.crt",
		notify  => Service['mysql'],  # this sets up the relationship
	}
*/

	file { '/etc/munin/plugins/mysql_connections':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/mysql_',
		notify => Service['munin-node'],
	}

	file { '/etc/munin/plugins/mysql_network_traffic':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/mysql_',
		notify => Service['munin-node'],
	}

	file { '/etc/munin/plugins/mysql_queries':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/mysql_queries',
		notify => Service['munin-node'],
	}

	file { '/etc/munin/plugins/mysql_slowqueries':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/mysql_slowqueries',
		notify => Service['munin-node'],
	}

	file { '/etc/munin/plugins/mysql_threads':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/mysql_threads',
		notify => Service['munin-node'],
	}

	file { '/etc/mysql/my.cnf':
		ensure  => 'file',
		content => template('mysql/my.cnf.erb'),
		group   => '0',
		mode    => '644',
		owner   => '0',
		notify  => Service['mysql'],
	}

}
