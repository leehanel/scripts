#!/bin/bash

repos=`find ./ -mindepth 1 -maxdepth 1 -type d`

for repo in $repos; do
    cd $repo
    echo $repo
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e "s/(//g" -e "s/)//g"`
    if [ $BRANCH == "master" ] ; then
	    git pull
    else
        git checkout master
        git pull
        git checkout $BRANCH
    fi
    cd ..
done
