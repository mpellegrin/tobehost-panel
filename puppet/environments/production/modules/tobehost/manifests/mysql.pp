class tobehost::mysql (
	$mysql_admin_login = '',
	$mysql_admin_password = '',

) inherits tobehost {

	include tobehost::mysql::install
	include tobehost::mysql::config
	include tobehost::mysql::services

}
