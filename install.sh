#!/bin/bash
set -e

apt-get update

# Puppet and dependencies
apt-get install puppet puppetmaster hiera

# Prompts MySQL root password to user
apt-get install mariadb-client mariadb-server

# Generates and set MySQL Puppet admin password
MYSQL_ADMIN_PASSWORD=`openssl rand -base64 32`
mysql --defaults-extra-file=/etc/mysql/debian.cnf -B -e "CREATE USER 'tbh_pp_admin'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}' ; GRANT ALL PRIVILEGES ON *.* TO 'tbh_pp_admin'@'localhost' WITH GRANT OPTION"

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
cp /etc/puppet/hieradata/production/site.yaml.dist /etc/puppet/hieradata/production/${HOSTNAME}.yaml
sed -i "s/_HOSTNAME_/$HOSTNAME/" /etc/puppet/hieradata/production/${HOSTNAME}.yaml
sed -i "s/_TBH_SQL_PASSWORD_/$MYSQL_ADMIN_PASSWORD/" /etc/puppet/hieradata/production/${HOSTNAME}.yaml
puppet agent --test

# Permissions fix
cp /usr/local/share/tobehost_panel/sites/default/default.settings.php /usr/local/share/tobehost_panel/sites/default/settings.php
chown -R root:tobehost_panel /usr/local/share/tobehost_panel
chmod -R g+w /usr/local/share/tobehost_panel/sites/default

echo ''
echo '** Installation complete **'
echo 'Now point your browser to your server to finalize panel installation.'
echo ''

