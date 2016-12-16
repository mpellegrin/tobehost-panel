class tobehost::mysql::install inherits tobehost::mysql {

	package {'mariadb-server':
		ensure => 'present',
	}
	package {'mariadb-client':
		ensure => 'present',
	}

	package {'mytop':
		ensure => 'present',
	}


}
