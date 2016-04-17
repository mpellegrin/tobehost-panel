class mysql::tobehost (

) inherits mysql::tobehost::params {

	include mysql::tobehost::install
	include mysql::tobehost::config
	include mysql::tobehost::services

}
