#!/bin/bash

#Script  to create a local (bare) copy of a remote repo, and keep it up to date
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
  repo_dir=`echo $repo | awk -F"/" '{print \$NF}'`
  if [ ! -e $repo_dir ]; then
    git clone --mirror $repo
  else
    cd $repo_dir
    git fetch --all
  fi
done
cd $OWD

