#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# As Drush does not support downloading plain directories, we targz the installation profile beforehand
tar -czf $DIR/tobehost_panel.tar.gz tobehost_panel

# Downloads Drupal core and contrib modules to target directory
drush make $DIR/tobehost_panel.make /usr/local/share/tobehost_panel --working-copy

# Deletes the temporary archive
rm $DIR/tobehost_panel.tar.gz

