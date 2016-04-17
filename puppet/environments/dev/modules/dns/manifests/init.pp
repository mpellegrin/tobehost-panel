class dns (

) inherits dns::params {

	include dns::install
	include dns::config
	include dns::services

	import 'tobehost/*.pp'
	include dns::tobehost

}
