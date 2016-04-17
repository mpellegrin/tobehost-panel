class web::mod_pagespeed inherits web {

	# Mod pagespeed
	file { '/etc/apt/sources.list.d/mod-pagespeed.list':
		ensure => 'file',
		group => 'root',
		owner => 'root',
		mode => 644,
		content => 'deb http://dl.google.com/linux/mod-pagespeed/deb/ stable main ',
	}
#	file { '/etc/apt/trusted.gpg.d/google-packages.gpg':
#		ensure => 'file',
#		group => 'root',
#		owner => 'root',
#		mode => 644,
#		source => 'puppet:///modules/web/apt/trusted.gpg.d/google-packages.gpg',
#	}
	package {'mod-pagespeed-stable':
		ensure => 'present',
		notify => Service['apache2'],
	}
	file { '/etc/apache2/mods-enabled/pagespeed.conf':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '../mods-available/pagespeed.conf',
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/pagespeed.load':
		ensure => 'link',
		group  => '0',
		owner  => '0',
		target => '../mods-available/pagespeed.load',
		notify => Service['apache2'],
	}
	file { '/etc/apache2/mods-available/pagespeed.conf':
		ensure => 'file',
		mode   => '644',
		group  => '0',
		owner  => '0',
		source => 'puppet:///modules/web/apache/mods-available/pagespeed.conf',
		notify => Service['apache2'],
	}

}

