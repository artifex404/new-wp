#!/bin/bash

## New-wp
## Downloads and installs a local WordPress with interactive command line configuration
##
## For more information see:
## https://github.com/artifex404/new-wp

#########   CONFIGURATION   #########

USERNAME="$(whoami)"
WPCLI="/Users/$USERNAME/wp-cli.phar"
PHP="/Applications/MAMP/bin/php/php5.6.10/bin/php"
WP="$PHP $WPCLI"
MYSQL="/Applications/MAMP/Library/bin/mysql"

######### END CONFIGURATION #########

echo ""
echo "**********************************"
echo "***   WordPress Installation   ***"
echo "**********************************"
echo ""

if [ ! -e "$MYSQL" ]; then
	echo -e "\033[1;31mError:\033[0m Please, indicate the right MySQL binary path in this script"
	exit 0
fi

if [ ! -e "$WPCLI" ]; then
	echo -e "\033[1;31mError:\033[0m Please, install WP-CLI first, and configure the path in this scrip"
	exit 0
fi

if [ ! -e "$PHP" ]; then
	echo -e "\033[1;31mError:\033[0m Please, indicate the right PHP binary path in this script"
	exit 0
fi

echo -n "==> Enter WordPress version to install (latest): "
read VERSION

if [[ $VERSION = "" ]]; then
	$WP core download
else
	$WP core download --version=$VERSION
fi

echo -n "==> Enter DB user (root): "
read DBUSER

if [[ $DBUSER = "" ]]; then
	DBUSER=root
fi

echo -n "==> Enter DB pass (root): "
read DBPASS

if [[ $DBPASS = "" ]]; then
	DBPASS=root
fi

echo -n "==> Create a new DB? [y/n]: "
read NEWDB

echo -n "==> Type the DB name to use: "
read WPDB

if [ $NEWDB = "y" -o $NEWDB = "Y" ]; then
	$MYSQL -u$DBUSER -p$DBPASS -e "CREATE DATABASE IF NOT EXISTS $WPDB"
	echo "Database $WPDB created"
fi

$WP core config --dbname=$WPDB --dbuser=$DBUSER --dbpass=$DBPASS

echo -n "==> Enter your installation URL: "
while read inputline; do
	WPURL=$inputline
	if [ ! -z $WPURL ]; then
		break
	fi
done

echo -n "==> Enter your Site Title (Sample Site): "
read WPTITLE

if [[ $WPTITLE = "" ]]; then
	WPTITLE="Sample Site"
fi

echo -n "==> Enter WP Super admin username (admin): "
read WPUSER

if [[ $WPUSER = "" ]]; then
	WPUSER="admin"
fi

echo -n "==> Enter WP Super admin password (admin): "
read WPPASS

if [[ $WPPASS = "" ]]; then
	WPPASS="admin"
fi

echo -n "==> Enter WP Super admin email (user@localhost.local): "
read WPEMAIL

if [[ $WPEMAIL = "" ]]; then
	WPEMAIL="user@localhost.local"
fi

$WP core install --url=$WPURL --title="$WPTITLE" --admin_user=$WPUSER --admin_password=$WPPASS --admin_email=$WPEMAIL
