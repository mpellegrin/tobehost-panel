class users::tobehost (
	$hostname = $users::tobehost::params::hostname,
	$shortname = $users::tobehost::params::shortname,
	$ovh_realname = $users::tobehost::params::ovh_realname,

) inherits users::tobehost::params {

	include users::tobehost::install
	include users::tobehost::config
	include users::tobehost::services

}
