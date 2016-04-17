class users::tobehost::install inherits users::tobehost {

	package { 'whois': # for mkpasswd
		ensure => 'present',
	}


}
