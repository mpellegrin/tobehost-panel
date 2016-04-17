class users (

) inherits users::params {

	include users::install
	include users::config
	include users::services

	import 'tobehost/*.pp'
	include users::tobehost

}
