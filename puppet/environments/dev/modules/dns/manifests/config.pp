class dns::config inherits dns {

	file { '/etc/bind/named.conf.local':
		ensure => 'file',
		mode => '644',
		owner => 'root',
		group => 'bind',
		source => 'puppet:///modules/dns/named.conf.local',
	}



}
