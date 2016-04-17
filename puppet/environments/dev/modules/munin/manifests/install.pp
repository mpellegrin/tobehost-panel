class munin::install inherits munin {

	package {'munin-node':
		ensure => 'present',
	}

	package {'libcache-cache-perl':
		ensure => 'present',
	}

	package {'libnet-ssleay-perl':
		ensure => 'present',
	}

	package {'liblwp-useragent-determined-perl':
		ensure => 'present',
	}

}
