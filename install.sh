#!/bin/bash
set -e

apt-get update

# Puppet and dependencies
apt-get install puppet puppetmaster puppet-module-puppetlabs-concat puppet-module-puppetlabs-mysql hiera

# Prompts MySQL root password to user
apt-get install mariadb-client mariadb-server

# Drush
wget https://s3.amazonaws.com/files.drush.org/drush.phar -O /usr/local/bin/drush
chmod +x /usr/local/bin/drush
drush core-status

# Drupal with Drush
drupal/build.sh

# Puppet setup
rsync -av --delete puppet/* /etc/puppet/
chown -R root:puppet /etc/puppet/
HOSTNAME=`hostname -f`
sed -i "s/_HOSTNAME_/$HOSTNAME/" /etc/puppet/puppet.conf
puppet agent --test

# Permissions fix
cp /usr/local/share/tobehost_panel/sites/default/default.settings.php /usr/local/share/tobehost_panel/sites/default/settings.php
chown -R root:tobehost_panel /usr/local/share/tobehost_panel
chmod -R g+w /usr/local/share/tobehost_panel/sites/default

echo ''
echo '** Installation complete **'
echo 'Now point your browser to your server to finalize panel installation.'
echo ''

