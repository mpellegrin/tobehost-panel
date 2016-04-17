class web (

) inherits web::params {

	import 'modules/*.pp'

	include web::install
	include web::config
	include web::services

	#include web::mod_pagespeed

	import 'tobehost/*.pp'
	include web::tobehost

}
