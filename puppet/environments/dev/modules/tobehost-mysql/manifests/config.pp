class tobehost::mysql::config inherits tobehost::mysql {

	file { '/etc/mysql/my.cnf':
		ensure  => 'file',
		content => template('mysql/my.cnf.erb'),
		group   => '0',
		mode    => '644',
		owner   => '0',
		notify  => Service['mysql'],
	}

	define tobehost_mysql_enable($mysql_username, $mysql_password) {

		exec {"mysql-createuser-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"CREATE USER '${mysql_username}'@'localhost' IDENTIFIED BY '${mysql_password}'\"",
			unless => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e 'SHOW GRANTS FOR ${mysql_username}@localhost'",
		}

		exec {"mysql-createdb-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"CREATE DATABASE ${mysql_username}\"",
			unless => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e 'SHOW DATABASES' | egrep '^${mysql_username}$'",
			require => Exec["mysql-createuser-${mysql_username}"],
		}

		exec {"mysql-grant-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"GRANT ALL PRIVILEGES ON \`${mysql_username}\`.* TO '${mysql_username}'@'localhost'\"",
			nless => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"SHOW GRANTS FOR '${mysql_username}'@localhost\" | egrep \"^GRANT ALL PRIVILEGES ON \`${mysql_username}\`.* TO '${mysql_username}'@'localhost'\"",
			require => Exec["mysql-createdb-${mysql_username}"],
		}

	}

	define tobehost_mysql_disable($mysql_username, $mysql_password) {

		exec {"mysql-grant-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"REVOKE ALL PRIVILEGES ON \`${mysql_username}\`.* FROM '${mysql_username}'@'localhost'\"",
			onlyif => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"SHOW GRANTS FOR '${mysql_username}'@localhost\" | egrep \"^GRANT ALL PRIVILEGES ON \`${mysql_username}\`.* TO '${mysql_username}'@'localhost'\"",
		}

	}

	define tobehost_mysql_delete($mysql_username, $mysql_password) {

		exec {"mysql-grant-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"REVOKE ALL PRIVILEGES ON \`${mysql_username}\`.* FROM '${mysql_username}'@'localhost'\"",
			onlyif => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"SHOW GRANTS FOR '${mysql_username}'@localhost\" | egrep \"^GRANT ALL PRIVILEGES ON \`${mysql_username}\`.* TO '${mysql_username}'@'localhost'\"",
		}

		exec {"mysql-createuser-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"DROP USER '${mysql_username}'@'localhost'\"",
			onlyif => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e 'SHOW GRANTS FOR ${mysql_username}@localhost'",
		}

		exec {"mysql-createdb-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"DROP DATABASE ${mysql_username}\"",
			onlyif => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e 'SHOW DATABASES' | egrep '^${mysql_username}$'",
			require => [Exec["mysql-createuser-${mysql_username}"], Exec["mysql-grant-${mysql_username}"]]
		}

	}

	$mysql_active = hiera('active-mysql')
	#notify{"The value is: ${mysql_active}": }
	create_resources(tobehost_mysql_enable, $mysql_active)

	$mysql_disabled = hiera('disabled-mysql')
	#notify{"The value is: ${mysql_disabled}": }
	create_resources(tobehost_mysql_disable, $mysql_disabled)

	$mysql_deleted = hiera('deleted-mysql')
	#notify{"The value is: ${mysql_deleted}": }
	create_resources(tobehost_mysql_delete, $mysql_deleted)

}
