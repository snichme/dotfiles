#!/bin/bash

set -e


echo "cask_args appdir: '/Applications'"

echo "tap 'homebrew/bundle'"
echo ""


cat <(brew list) | while read line
do
 echo "brew '$line'";
done

cat <(brew cask list) | while read line
do
 echo "cask '$line'";
done
