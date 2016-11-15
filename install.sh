#!/bin/bash
set -e

apt-get update

# Puppet and dependencies
apt-get install puppet puppetmaster puppet-module-puppetlabs-concat puppet-module-puppetlabs-mysql hiera

# Drush
wget https://s3.amazonaws.com/files.drush.org/drush.phar -O /usr/local/bin/drush
chmod +x /usr/local/bin/drush
drush core-status

# Drupal with Drush
drupal/build.sh

# Puppet setup
rsync -av --delete puppet/* /etc/puppet/
puppet agent --test

echo 'Now point your browser to your server to finalize panel installation.'

