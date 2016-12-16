class tobehost::mysql (

) inherits tobehost {

	include tobehost::mysql::install
	include tobehost::mysql::config
	include tobehost::mysql::services

}
