class tobehost::users::config inherits tobehost {

	$home_root = '/data/home';

	file { $home_root: 
		ensure => 'directory',
		owner  => 'root',
		group  => 'root',
		mode   => '755',
	}

	file {'/etc/nsswitch.conf':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '644',
		source => 'puppet:///modules/users/nss/nsswitch.conf',
		notify => Service['nscd'],
	}

	file {'/etc/nss-pgsql.conf':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '644',
		source => 'puppet:///modules/users/nss/nss-pgsql.conf',
		notify => Service['nscd'],
	}

	file {'/etc/nss-pgsql-root.conf':
		ensure => 'file',
		owner  => 'root',
		group  => 'root',
		mode   => '640',
		source => 'puppet:///modules/users/nss/nss-pgsql-root.conf',
		notify => Service['nscd'],
	}
	define tobehost_create_user($unix_username, $email) {

		exec {"/usr/sbin/quotatool -u ${unix_username} -b -l 300MB ${home_root}":
			onlyif => "/usr/bin/quota ${unix_username} | /bin/egrep -q 'Disk quotas for user ${unix_username} \(uid [0-9]+\): .+'",
			#require => User[$unix_username],
		}

		file {"${home_root}/${unix_username}":
			mode => '750',
			owner => 'root',
			group => $unix_username,
		}

		file { "${home_root}/${unix_username}/.forward":
			ensure => 'present',
			content => $email,
			owner => $unix_username,
			#require => User[$unix_username];
			require => File["/data/home/${unix_username}"];
		}
	}

	define tobehost_disable_user($unix_username, $email) {

		exec {"/usr/sbin/quotatool -u ${unix_username} -b -l 1B ${home_root}":
			onlyif => "/usr/bin/quota ${unix_username} | /bin/egrep -q 'Disk quotas for user ${unix_username} \(uid [0-9]+\): .+'",
			require => User[$unix_username],
		}

		file {"${home_root}/${unix_username}":
			mode => '750',
			owner => 'root',
			group => $unix_username,
		}
	}

	define tobehost_delete_user($unix_username, $email) {

		file {"${home_root}/${unix_username}":
			ensure => 'absent',
		}

	}

	$user_active = hiera('active-user')
	#notify{"The value is: ${user_active}": }
	create_resources(tobehost_create_user, $user_active)

	$user_disabled = hiera('disabled-user')
	#notify{"The value is: ${user_disabled}": }
	create_resources(tobehost_disable_user, $user_disabled)

	$user_deleted = hiera('deleted-user')
	#notify{"The value is: ${user_deleted}": }
	create_resources(tobehost_delete_user, $user_deleted)

}
