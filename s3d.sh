#!/bin/bash

# Copyright © 2000 Tsuyoshi KANEKO <kaneko1989@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING file for more details.

# check the arguments
# 1st one is the environment defined in s3d.conf. others are ignored.
if [ $# -lt 1 ]; then
  echo "Specify the environment.";
  echo "usage: ./s3d.sh <environment>";
  exit 1;
fi

# flag for result output
DEPLOYED=1;

# load the configuration from s3d.conf
egrep -v '^#' ./s3d.conf | while read env profile bucket; do

  # ignore settings not specified as the argument
  if [ "$1" != "$env" ]; then
    continue;
  fi;

  DEPLOYED=0;

  echo "Start deploying files to $bucket using $profile."

  # deploy all files in the directory (ignoring s3d.sh and s3d.conf)
  ls  | egrep -v "(s3d.sh|s3d\.conf)" | while read file; do
    echo "deploying $file...";
    aws s3 cp "$file" "s3://$bucket" --recursive --profile "$profile"
    if [ $? -eq 0 ]; then
      echo "Now $file is deployed!";
    else
      echo "Failed to deploy $file.";
    fi;
  done;

  break;

done;

# print the result message
if [ $DEPLOYED -eq 0 ]; then
  echo "Deploy finished!";
else
  echo "Invalid environment. Check s3d.conf.";
fi;
