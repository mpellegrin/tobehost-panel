class dns::install inherits dns {

	# Bind
	package {'bind9':
		ensure => 'present',
	}

}
