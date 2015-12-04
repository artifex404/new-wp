# new-wp
Downloads and installs a local WordPress. Asks interactively on command line for required configuration settings.

Initial configuration is setup to work the latest MAMP Pro installation on a Mac OS X 10.11.

##Requirements

[WP-CLI](http://wp-cli.org/)
PHP
MySQL

##Installation
Run this command in a terminal:

`curl -sS https://raw.githubusercontent.com/artifex404/new-wp/master/installer.sh | bash`

##Configuration

When installed, be sure to edit the ~/new-wp.sh file and enter correct WP-CLi, PHP and MySQL binaries paths.

##Usage
new-wp

##Options

All WordPress related configurations are asked interactively when new-wp is run.