class nagios (

) inherits nagios::params {

	include nagios::install
	include nagios::config
	include nagios::services

}
