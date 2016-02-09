# ToBeHost Panel
The project of an opensource web panel, designed for free web hosting

## History
The ToBeHost project is lasting since approximately ten years. At that time, the project is quite dead, sleeping in onea virtual machine, waiting for some spare time from one of its admins.

While making ToBeHost, we tried many web panels, and the last we are still using is VHFFS. This panel covers our needs, and even if we learned a lot using it, many cutting edges made us (the admins) frustrated :
 * We are not fluent in Perl and therefore we hardly understand all the logic behind the API and source code of VHFFS ;
 * It was hard to customize the panel appearence ;
 * The learning curve for installing his own panel from scratch is too high ;
 * Softwares like MySQL and the FTP server have to be patched and compiled manually to work with the panel.

While great ideas are already implemented in VHFFS, VHFFS is simply "too awesome" for us.
 * We don't need multiple servers and file replication ;
 * We don't need mailing lists, mail, or custom DNS zones ;
 * We don't need repositories for our users (Git, SVN, Mercurial...) ;
 * The workflow with "projects", but adds unnecessary validation steps and complexity to interfaces.

So, let's reboot this. Make a web panel with a CMS (Drupal), default Debian packages, and a configuration management (Puppet), for an end-to-end ease of use and administration.

Let's do make what panels like ISPConfig of Vitualmin do, but simpler, adapted to a moderation workflow, and easy to install.

## What this repository will contain

This repository will mostly contain configuration files, and build scripts. You should be able to have a fully functional web hostng server in a few minutes with the install script.

The upgrade path will be specified in documentation but we will try make it as smooth as possible. If you are not familiar with Drush and Puppet, you should read the documentation before trying to install this software.

## What this project will never be

This project is not intended to be a concurrent to commercial hosting platforms, or existing web panels. It's just a software we need, and we think it's worth sharing.

If you are a self-hosting enthousiast, you are very welcome to join us. :)
