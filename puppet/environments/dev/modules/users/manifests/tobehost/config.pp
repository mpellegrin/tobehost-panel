class users::tobehost::config inherits users::tobehost {

	file { '/data/home/': 
		ensure => 'directory',
		owner => 'root',
		group => 'root',
		mode => '755',
	}


	file {'/etc/nsswitch.conf':
		ensure => 'file',
		owner => 'root',
		group => 'root',
		mode   => '644',
		source => 'puppet:///modules/users/nss/nsswitch.conf',
		#notify => Service['nscd'],
	}

	file {'/etc/nss-pgsql.conf':
		ensure => 'file',
		owner => 'root',
		group => 'root',
		mode   => '644',
		source => 'puppet:///modules/users/nss/nss-pgsql.conf',
		#notify => Service['nscd'],
	}

	file {'/etc/nss-pgsql-root.conf':
		ensure => 'file',
		owner => 'root',
		group => 'root',
		mode   => '640',
		source => 'puppet:///modules/users/nss/nss-pgsql-root.conf',
		#notify => Service['nscd'],
	}
	define tobehost_create_user($unix_username, $email) {

		/*
		group { $unix_username:
			ensure => 'present',
			system => 'no',
		}

		user { $unix_username:
			ensure  => 'present',
			system => 'no',
			comment => "${first_name} ${last_name}",
			#password => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${unix_password} | tr -d '\n'"),
			home => "/data/home/${unix_username}",
			gid => $unix_username,
			managehome => true,
			shell => '/bin/bash',
		}

		#$salted_paswd = generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${unix_password} | tr -d '\n'")
		#exec {"/usr/sbin/usermod -p '${unix_password}' ${unix_username}":
		exec {"/bin/echo -e \"${unix_password}\n${unix_password}\" | /usr/bin/passwd -q '${unix_username}'":
			onlyif => "/bin/egrep -q '^${unix_username}:[*!]' /etc/shadow",
			require => User[$unix_username],
		}

		exec {"/usr/sbin/usermod -aG ${unix_username} www-data":
			unless => "/bin/grep -q '${unix_username}\\S*www-data' /etc/group",
			require => User[$unix_username],
		}
		*/

		exec {"/usr/sbin/quotatool -u ${unix_username} -b -l 300MB /var":
			onlyif => "/usr/bin/quota ${unix_username} | /bin/egrep -q 'Disk quotas for user ${unix_username} \(uid [0-9]+\): .+'",
			#require => User[$unix_username],
		}

		file {"/data/home/${unix_username}":
			mode => '750',
			owner => 'root',
			group => $unix_username,
		}

		file { "/data/home/${unix_username}/.forward":
			ensure => 'present',
			content => $email,
			owner => $unix_username,
			#require => User[$unix_username];
			require => File["/data/home/${unix_username}"];
		}
	}

	define tobehost_disable_user($unix_username, $email) {

		/*
		group { $unix_username:
			ensure => 'present',
			system => 'no',
		}

		user { $unix_username:
			ensure  => 'present',
			system => 'no',
			comment => "${first_name} ${last_name}",
			password => '!',
			home => "/data/home/${unix_username}",
			gid => $unix_username,
			managehome => true,
			shell => '/bin/false',
		}

		exec {"/usr/sbin/usermod -aG ${unix_username} www-data":
			unless => "/bin/grep -q '${unix_username}\\S*www-data' /etc/group",
			require => User[$unix_username],
		}
		*/

		exec {"/usr/sbin/quotatool -u ${unix_username} -b -l 300MB /var":
			onlyif => "/usr/bin/quota ${unix_username} | /bin/egrep -q 'Disk quotas for user ${unix_username} \(uid [0-9]+\): .+'",
			require => User[$unix_username],
		}

		file {"/data/home/${unix_username}":
			mode => '750',
			owner => 'root',
			group => $unix_username,
		}
	}

	define tobehost_delete_user($unix_username, $email) {

		file {"/data/home/${unix_username}":
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
