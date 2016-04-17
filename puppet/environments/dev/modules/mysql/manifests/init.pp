class mysql (

) inherits mysql::params {

	include mysql::install
	include mysql::config
	include mysql::services

	import 'tobehost/*.pp'
	include mysql::tobehost

}
