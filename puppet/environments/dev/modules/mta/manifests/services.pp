class mta::services inherits mta {

	service { "exim4":
		ensure  => "running",
		enable  => "true",
		hasrestart => "true",
		require => Package["exim4"],
	}

}
