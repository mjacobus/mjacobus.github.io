#!/bin/bash

# Execute this script and you might have a better idea of how git-svn works
# I think the main point here is to ilustrate how to commit/update from git-svn
# ultility
#
# Keep in mind that when merge svn branches you won't get the feature branch
# commits on top of your target branch. Instead it will only modify your files
# on your working copy and than you can commit the merge.
#
# Also, you should avoid fetching code from multiples sources. Pretend you are
# working on a undistribuited SCM, because you kinda are.

# Sandbox configuration. Change this variable if you want it in somewhere else
SANDBOX=/tmp/sandbox

# Do not change this
SVN_REPO=$SANDBOX/svn_repo
SVN_URL=file:///$SANDBOX/svn_repo
SVN_CLONE=$SANDBOX/svn_clone
GIT_CLONE=$SANDBOX/git_clone

###############################################################################
# Setup: Reset sandbox
###############################################################################

rm -rf $SANDBOX
mkdir -p $SANDBOX

###############################################################################
# create repository
###############################################################################

svnadmin create $SVN_REPO

# creating folders
svn mkdir $SVN_URL/trunk -m "Created trunk"
svn mkdir $SVN_URL/branches -m "Created branches"
svn mkdir $SVN_URL/tags -m "Created tags"

###############################################################################
# svn clone and adding of files
###############################################################################

mkdir -p $SVN_CLONE
cd $SVN_CLONE
svn co $SVN_URL/trunk .

# adding files
echo "# Git SVN Test" >> README.md
svn add README.md
svn commit -m "First trunk commit"

echo "Short description comes here" >> README.md
svn add README.md
svn commit -m "Second trunk commit"

###############################################################################
# git clone
###############################################################################

# -s is the same as '-T trunk -b branches -t tags'
git svn clone $SVN_URL $GIT_CLONE -s

###############################################################################
# Creating branch via svn, and switching to it: Hilarious
###############################################################################

cd $SVN_CLONE
svn copy $SVN_URL/trunk $SVN_URL/branches/new-feature -m "Creating a new branch"

svn switch $SVN_URL/branches/new-feature

# Commiting some changes

echo "# New Feature" >> NEW_FEATURE.md
svn add NEW_FEATURE.md
svn commit -m "First new-feature branch commit"

echo "Short description" >> NEW_FEATURE.md
svn add NEW_FEATURE.md
svn commit -m "Second new-feature branch commit"


###############################################################################
# Updating add commiting to trunk from git
###############################################################################

cd $GIT_CLONE

git svn rebase

echo "A third line" >> README.md
git commit -am "First commit to trunk via git" # local commit

echo "A fourth line" >> README.md
git commit -am "Second commit to trunk via git" # local commit

# push to svn repo
git svn dcommit

###############################################################################
# Checking out  the feature branch from git
###############################################################################

cd $GIT_CLONE

git svn fetch # update the remote branches information

git checkout -b new-feature new-feature

# changing and commiting to feature branch

echo "A third line" >> NEW_FEATURE.md
git commit -am "First commit to new-feature branch via git" # local commit

echo "A fourth line" >> NEW_FEATURE.md
git commit -am "Second commit to new-feature branch via git" # local commit

# push to svn repo
git svn dcommit

###############################################################################
# Merging feature branch to trunk with git
###############################################################################

# CAUTION:
# All the feature branch commits are grouped into one commit when merging via git
# This is somehow a svn limitation and not git-svn

cd $GIT_CLONE

git checkout master
git merge new-feature -m "Merged all commits from new-feature branch into a single commit to trunk via git"
git branch -d new-feature
git svn dcommit

###############################################################################
# Merging feature branch to trunk in with svn: If you were to
###############################################################################

# if you were to merge with svn
# cd $SVN_CLONE
# svn switch $SVN_URL/trunk
# svn merge $SVN_URL/branches/new-feature
# svn commit -m "Merged all commits from new-feature branch into a single commit to trunk via svn"

###############################################################################
# Checking: switching to trunk and updating in svn
###############################################################################

cd $SVN_CLONE
svn switch $SVN_URL/trunk
svn update
