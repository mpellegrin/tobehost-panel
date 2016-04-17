class mta::install inherits mta {

	package { 'exim4':
		ensure => 'present',
	}

}
