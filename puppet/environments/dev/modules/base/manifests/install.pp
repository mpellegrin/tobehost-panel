class base::install inherits base {

	package { 'openssh-server':
		ensure => 'present',
	}
	package { 'sudo':
		ensure => 'present',
	}
	package { 'vim':
		ensure => 'present',
	}
	package { 'dnsutils':
		ensure => 'present',
	}
	package {'aptitude':
		ensure => 'present',
	}
	package {'puppet':
		ensure => 'present',
	}
	package {'augeas-tools':
		ensure => 'present',
	}
	package {'ntp':
		ensure => 'present',
	}
	package {'ntpdate':
		ensure => 'present',
	}
	package {'rsync':
		ensure => 'present',
	}
	package {'iotop':
		ensure => 'present',
	}
	package {'iftop':
		ensure => 'present',
	}
	package {'screen':
		ensure => 'present',
	}
	package {'less':
		ensure => 'present',
	}
	package {'unzip':
		ensure => 'present',
	}
	package {'bzip2':
		ensure => 'present',
	}
	package {'curl':
		ensure => 'present',
	}
	package {'wget':
		ensure => 'present',
	}
	package {'iptables-persistent':
		ensure => 'present',
	}
#	package {'libpam-yubico':
#		ensure => 'present',
#	}
#	package {'libnet-ssleay-perl':
#		ensure => 'present',
#	}
}
