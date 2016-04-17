class web::tobehost (

) inherits web::tobehost::params {

	include web::tobehost::install
	include web::tobehost::config
	include web::tobehost::services

}
