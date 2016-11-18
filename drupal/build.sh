#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# As Drush does not support downloading plain directories, we targz the installation profile beforehand
tar -czf tobehost_panel.tar.gz tobehost_panel

# Downloads Drupal core and contrib modules to target directory
drush make tobehost_panel.make /usr/local/share/tobehost_panel --working-copy

# TODO: Fixes permissions

# Deletes the temporary archive
rm tobehost_panel.tar.gz

