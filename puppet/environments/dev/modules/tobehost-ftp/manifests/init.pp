class tobehost::ftp (

) inherits tobehost {

	include tobehost::ftp::install
	include tobehost::ftp::config
	include tobehost::ftp::services

}
