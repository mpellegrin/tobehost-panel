class tobehost::users::services inherits tobehost::users {

	Service {'nscd':
		enable => true,
		ensure => 'running',
		hasrestart => true,
	}

}
