# new-wp
Downloads and installs a local WordPress. Asks interactively on command line for required configuration settings.

Default configuration file is setupup to work with the latest MAMP Pro on a Mac OS X 10.11.

## Requirements

* [WP-CLI](http://wp-cli.org/)
* PHP
* MySQL

## Installation
Run this command in a terminal:

`curl -sS https://raw.githubusercontent.com/artifex404/new-wp/master/installer.sh | bash`

If the command `new-wp` does not do anything after the installation, enter:

`source ~/.bash_profile`

## Configuration

When installed, edit the ~/new-wp.sh file and enter the correct paths to WP-CLI, PHP and MySQL binaries.

## Usage
new-wp

## Options

All WordPress related configurations are asked interactively when new-wp is run.
