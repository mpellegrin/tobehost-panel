class tobehost::mysql::config inherits tobehost::mysql {

	file { '/etc/mysql/my.cnf':
		ensure  => 'file',
		content => template('mysql/my.cnf.erb'),
		group   => '0',
		mode    => '644',
		owner   => '0',
		notify  => Service['mysql'],
	}

	define tobehost_mysql_enable($entity_id, $tbh_sql_name, $tbh_sql_password) {
		$mysql_username = "${entity_id}_${tbh_sql_name}"
		$mysql_password = $tbh_sql_password

                exec {"mysql-create-${mysql_username}":
                        command => "/usr/bin/mysql -B -u ${adm_login} --password='${adm_password}' -e \"CREATE USER '${mysql_username}'@'localhost' IDENTIFIED BY '${mysql_password}' ; CREATE DATABASE ${mysql_username} ; GRANT ALL PRIVILEGES ON \`${mysql_username}\`.* TO '${mysql_username}'@'localhost'",
                        creates => "/var/lib/mysql/${mysql_username}",
                }                                                                                                                                                                                                  
	}

	define tobehost_mysql_disable($entity_id, $tbh_sql_name, $tbh_sql_password) {
		$mysql_username = "${entity_id}_${tbh_sql_name}"
		$mysql_password = $tbh_sql_password

		exec {"mysql-disable-${mysql_username}":
			command => "/usr/bin/mysql -B -u ${mysql_admin_login} --password='${mysql_admin_password}' -e \"REVOKE ALL PRIVILEGES ON \`${mysql_username}\`.* FROM '${mysql_username}'@'localhost'\"",
                        onlyif => "/var/lib/mysql/${mysql_username}",
		}

	}

	define tobehost_mysql_delete($entity_id, $tbh_sql_name, $tbh_sql_password) {
		$mysql_username = "${entity_id}_${tbh_sql_name}"
		$mysql_password = $tbh_sql_password

		exec {"mysql-delete-${mysql_username}":
                        command => "/usr/bin/mysql -B -u ${adm_login} --password='${adm_password}' -e \"DROP USER '${mysql_username}'@'localhost' ; DROP DATABASE ${mysql_username} ; REVOKE ALL PRIVILEGES ON \`${mysql_username}\`.* TO '${mysql_username}'@'localhost'",
                        onlyif => "/var/lib/mysql/${mysql_username}",
		}

	}

	$mysql_active = hiera('active-mysql')
	create_resources(tobehost_mysql_enable, $mysql_active)

	$mysql_disabled = hiera('disabled-mysql')
	create_resources(tobehost_mysql_disable, $mysql_disabled)

	$mysql_deleted = hiera('deleted-mysql')
	create_resources(tobehost_mysql_delete, $mysql_deleted)

}
