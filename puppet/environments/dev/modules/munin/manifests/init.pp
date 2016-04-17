class munin (
	$tls = $munin::params::tls

) inherits munin::params {

	include munin::install
	include munin::config
	include munin::services

	import 'plugins/*.pp'
	include munin::plugins::ping
	include munin::plugins::apt

}
