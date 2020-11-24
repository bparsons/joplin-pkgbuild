#!/bin/bash

readonly joplin_dir="/usr/share/joplin-cli/app"

[[ -d $joplin_dir ]] || {
  echo "Directory $joplin_dir does not exist";
  exit 1;
}

cd $joplin_dir

node main.js ${@}
