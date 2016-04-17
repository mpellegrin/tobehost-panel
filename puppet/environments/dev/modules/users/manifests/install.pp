class users::install inherits users {

	user { 'mathieu':
		ensure  => 'present',
		comment => 'Mathieu',
		gid     => 'mathieu',
		groups  => ['sudo'],
		home    => '/home/mathieu',
		shell   => '/bin/bash',
		managehome => true,
	}

	group {'mathieu':
		ensure => 'present',
	}

	user { 'saphirblanc-ssh':
		ensure  => 'present',
		comment => 'Yann',
		gid     => 'saphirblanc-ssh',
		groups  => ['sudo'],
		home    => '/home/saphirblanc-ssh',
		shell   => '/bin/bash',
		managehome => true,
	}

	group {'saphirblanc-ssh':
		ensure => 'present',
	}

}
