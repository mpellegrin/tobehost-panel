class web::tobehost::install inherits web::tobehost {

	user { 'tobehost_panel':
		ensure  => 'present',
		comment => 'ToBeHost panel',
		gid     => 'tobehost_panel',
		home    => '/usr/local/share/tobehost_panel',
		shell   => '/bin/false',
		managehome => false,
	}

	group {'tobehost_panel':
		ensure => 'present',
		members => 'www-data',
	}

	exec {"/usr/sbin/usermod -aG tobehost_panel www-data":
		unless => "/bin/grep -q 'tobehost_panel\\S*www-data' /etc/group",
		require => [ User['tobehost_panel'], Group['tobehost_panel'] ],
	}

	/*
	user {'monstaftp':
		ensure  => 'present',
		system => 'no',
		home => '/usr/local/share/monstaftp',
		gid => 'monstaftp',
		managehome => false,
		shell => '/bin/false',
		password => '!',
	}

	group {'monstaftp':
		ensure => 'present',
		members => 'www-data'
	}

	user {'pydio':
		ensure  => 'present',
		system => 'no',
		home => '/usr/local/share/pydio',
		gid => 'pydio',
		managehome => false,
		shell => '/bin/false',
		password => '!',
	}

	group {'pydio':
		ensure => 'present',
		members => 'www-data'
	}
	*/

	user {'net2ftp':
		ensure  => 'present',
		system => 'no',
		home => '/usr/local/share/net2ftp',
		gid => 'net2ftp',
		managehome => false,
		shell => '/bin/false',
		password => '!',
	}

	group {'net2ftp':
		ensure => 'present',
		members => 'www-data'
	}

}
