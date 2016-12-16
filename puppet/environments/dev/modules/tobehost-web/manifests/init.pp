class web (

) inherits tobehost {

	include tobehost::web::install
	include tobehost::web::config
	include tobehost::web::services

}
