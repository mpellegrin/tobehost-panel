# Installations instructions

To run the automated setup, run `install.sh`, otherwise continue to manual setup.

## Install Puppet and Hiera

Install the following packages : puppet puppetmaster puppet-module-puppetlabs-concat puppet-module-puppetlabs-mysql hiera

## Install Drush

Download the latest release : `wget https://s3.amazonaws.com/files.drush.org/drush.phar -O drush`

Test your install : `php drush core-status`

Make `drush` executable : `chmod +x drush`

Move the Drush executable to `/usr/local/bin` : `mv drush /usr/local/bin`

Optionally, enrich the bash startup file with completion and aliases : `drush init`

## Install the panel

Run `drupal/build.sh`

## Setup Puppet

Replace the content of `/etc/puppet/` with the `puppet/` directory located inside this repository :
```
rsync -av --delete puppet/* /etc/puppet/
```

## Run Puppet to finalize installation

```puppet agent --test```

## Setup the panel

Run the panel installation by pointing your server IP/hostname with a web browser.

