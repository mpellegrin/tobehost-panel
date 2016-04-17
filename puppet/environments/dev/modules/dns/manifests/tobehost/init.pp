class dns::tobehost (

) inherits dns::tobehost::params {

	include dns::tobehost::install
	include dns::tobehost::config
	include dns::tobehost::services

}
