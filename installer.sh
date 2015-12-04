#!/bin/bash

curl -sS https://raw.githubusercontent.com/artifex404/new-wp/master/zip-git.sh -o ~/new-wp.sh
chmod u+x ~/zip-git.sh
echo "alias new-wp='~/new-wp.sh'" >> ~/.bash_profile
source ~/.bash_profile
echo -e '\033[1m\033[32mNew-wp installed successfully!\033[0m'