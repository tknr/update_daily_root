#!/bin/bash -x
echo "this command must be executed in root user."

## yum
/usr/bin/yum clean all || exit 1
/usr/bin/yum makecache || exit 1

## updatedb
/bin/updatedb

## pip
package_array=("pip" "youtube-dl")
for package in "${package_array[@]}"
do
	pip install --upgrade $package
done

##
/usr/local/bin/renice_all

