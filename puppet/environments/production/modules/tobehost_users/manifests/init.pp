class tobehost::users (

) inherits tobehost {

	include tobehost::users::install
	include tobehost::users::config
	include tobehost::users::services

}
