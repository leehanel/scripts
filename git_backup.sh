#!/bin/bash

#give me a list of remote repos
repos=""
#give me a repo dir(default to git-local in users home dir
repodir="${HOME}/git-local"

if [ ! -e ${repodir} ]; 
   mkdir -p
fi
OWD=$PWD
cd ${repodir}

for repo in $repos; do
  if [ ! -e $repo ];
    git clone --depth 1 $repo
  else
    cd $repo
    git fetch origin master
    git reset --hard FETCH_HEAD
    git clean -d -f -x
  fi
done
cd $OWD
