class base::ssl inherits base {

	file {'/etc/ssl/tobehost':
		ensure => 'directory',
		mode => 550,
		owner => 'root',
		group => 'ssl-cert',
	}

	file {'/etc/ssl/tobehost/tobehost.key':
		ensure => 'file',
		mode => 440,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.key',
	}

	file {'/etc/ssl/tobehost/tobehost.crt':
		ensure => 'file',
		mode => 444,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.crt',
	}

	file {'/etc/ssl/tobehost/tobehost.pem':
		ensure => 'file',
		mode => 440,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.pem',
	}

	file {'/etc/ssl/tobehost/tobehost.ca-bundle':
		ensure => 'file',
		mode => 444,
		owner => 'root',
		group => 'ssl-cert',
		source => 'puppet:///modules/base/ssl/tobehost/tobehost.ca-bundle',
	}

}
