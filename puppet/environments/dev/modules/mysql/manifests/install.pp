class mysql::install inherits mysql {

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
