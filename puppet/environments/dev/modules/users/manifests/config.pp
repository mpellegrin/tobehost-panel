class users::config inherits users {

	file {'/root/.bashrc/':
		ensure => 'file',
		mode => 644,
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/users/root_bashrc'
	}

	file {'/home/saphirblanc-ssh/':
		ensure => 'directory',
		mode => 750,
		owner => 'saphirblanc-ssh',
		group => 'saphirblanc-ssh',
	}

	file {'/home/saphirblanc-ssh/.bashrc':
		ensure => 'file',
		mode => 644,
		owner => 'saphirblanc-ssh',
		group => 'saphirblanc-ssh',
		source => 'puppet:///modules/users/user_bashrc'
	}

	file {'/home/mathieu/':
		ensure => 'directory',
		mode => 750,
		owner => 'mathieu',
		group => 'mathieu',
	}

	file {'/home/mathieu/.bashrc':
		ensure => 'file',
		mode => 644,
		owner => 'mathieu',
		group => 'mathieu',
		source => 'puppet:///modules/users/user_bashrc'
	}

	ssh_authorized_key {
			'mathieu@globosting.eu':
					ensure  => present,
					user    => mathieu,
					type    => 'ssh-rsa',
					key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDgReBGfCW2H3+/gkORqst7b2Iwaml9p1B25tyZyx4U4v5KnErpknZ59AOBZh6BsH9ucCQuWRC60KVAqFvWykR+cumk/8qF0NZc4FJv2XmMZKtUzS7Q/vth8zFrTQKCZCGjmLFg1D1c7jnQ3zgFlULRzTKjOPC1E1s3jWGQ2O8Pd2FdesrMVVcITKGVcnCocY4e0lWmFbdEOBLojneWjjTdXxFoUd/Rc63REkDDR9h3JenJtC5hXbrt4NsUiY3g6FOis2wT76d3eBhgS8k+dIh3ScTaFbThXddB0OGViIyMEyc41qFt5wIq2VDyWK6WfZNELZ85DOQZLzTAdu+PSzYh';
	#		'saphirblanc-ssh@globosting.eu':
	#				ensure  => present,
	#				user    => saphirblanc-ssh,
	#				type    => 'ssh-rsa',
	#				key     => '';
	}

	file {'/home/mathieu/.yubico/':
		ensure => 'directory',
		mode => 750,
		owner => 'mathieu',
		group => 'mathieu',
	}
	file {'/home/mathieu/.yubico/authorized_yubikeys':
		ensure => 'file',
		mode => 600,
		owner => 'mathieu',
		group => 'mathieu',
		content => "mathieu:ccccccbrvvii
mathieu:ccccccdvjvic",
	}

	file {'/home/saphirblanc-ssh/.yubico/':
		ensure => 'directory',
		mode => 750,
		owner => 'saphirblanc-ssh',
		group => 'saphirblanc-ssh',
	}
	file {'/home/saphirblanc-ssh/.yubico/authorized_yubikeys':
		ensure => 'file',
		mode => 600,
		owner => 'saphirblanc-ssh',
		group => 'saphirblanc-ssh',
		content => 'saphirblanc-ssh:ccccccblukjl',
	}


	file {'/etc/vim/vimrc.local':
		ensure => 'file',
		mode => 644,
		owner => 'root',
		group => 'root',
                require => Package["vim"],
                source => 'puppet:///modules/users/vimrc.local',
	}

	# Désactivation de yubikey sur tous les serveurs (cas d'urgence)

	#file {'/etc/pam.d/common-auth':
	#	ensure => 'file',
	#	mode => 644,
	#	owner => root,
	#	group => root,
	#	content => template("pamd-commonauth-noyubikey"),
	#}


}
