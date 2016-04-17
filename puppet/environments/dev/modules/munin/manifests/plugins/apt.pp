class munin::plugins::apt inherits munin::plugins {

	# "apt" plugin
	file { '/etc/munin/plugins/apt':
		ensure => 'link',
		group  => '0',
		mode   => '777',
		owner  => '0',
		target => '/usr/share/munin/plugins/apt',
		notify => Service['munin-node'],
		require => Package['munin-node'],
	}

	# "apt" plugin configuration
	file { '/etc/munin/plugin-conf.d/apt':
		ensure => 'present',
		group  => '0',
		mode   => '644',
		owner  => '0',
		source => 'puppet:///modules/munin/plugin-conf.d/apt',
		notify => Service['munin-node'],
		require => Package['munin-node'],
	}

	file { '/etc/cron.d/munin-node':
		ensure  => 'file',
		content => '#
# cron-jobs for munin-node
#

MAILTO=root

# If the APT plugin is enabled, update packages databases approx. once
# an hour (12 invokations an hour, 1 in 12 chance that the update will
# happen), but ensure that there will never be more than two hour (7200
# seconds) interval between updates..
*/5 * * * *	root export MUNIN_PLUGSTATE="/var/lib/munin-node/plugin-state/root"; if [ -x /etc/munin/plugins/apt_all ]; then /etc/munin/plugins/apt_all update 7200 12 >/dev/null; elif [ -x /etc/munin/plugins/apt ]; then /etc/munin/plugins/apt update 7200 12 >/dev/null; fi
',
		group   => '0',
		mode    => '644',
		owner   => '0',
		require => Package['munin-node'],
	}

}
