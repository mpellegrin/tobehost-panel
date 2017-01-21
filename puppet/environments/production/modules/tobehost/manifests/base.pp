class tobehost::base (

) inherits tobehost {

	include tobehost::base::install
	include tobehost::base::config
	include tobehost::base::services

}
