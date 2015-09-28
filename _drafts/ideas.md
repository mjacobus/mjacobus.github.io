http://stackoverflow.com/questions/14788345/how-to-install-jdk-on-ubuntu-linux

http://askubuntu.com/questions/452108/cannot-change-screen-size-from-640x480-after-14-04-installation-on-virtualbox-os

TDD presentation

Why you should try vim

-----------------------------------------------------------------
## Git Svn

### Working with branches

#### Creating a local branch

  git checkout my-branch

  git commit -m "first branch commit"
  git commit -m "second branch commit"

#### Merging the local branch

  git checkout master
  git merge my-branch -m "Description of the mergin"

If no message is given to the merge, it will be "Merge branch my-branch"

Note that altough you made 2 commits, when you merge a local branch and pushes that to the SVN repository you will have only one commit that groups all your branch commits.

[Source](http://git-scm.com/book/en/v1/Git-and-Other-Systems-Git-and-Subversion#Switching-Active-Branches)

More on mergin vs rebase

http://stackoverflow.com/questions/6457490/git-merge-vs-rebase-using-git-svn
http://stackoverflow.com/questions/266395/git-svn-how-do-i-create-a-new-svn-branch-via-git

git checkout vacation
git rebase master 
[ masters's chages put behind this branches, replay every commit ]
git checkout master
git merge --ff-only vacation
git svn dcommit 
[ each change goes into svn as seperate commit ]

-------------------------

Failing installing dependencies
http://stackoverflow.com/questions/21168141/can-not-install-packages-using-node-package-manager-in-ubuntu

------ fixed failed rvm install
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3

----------------------------------

## lotus framework

- Why params do not throw exception when unauthorized params are used? [link](http://lotusrb.org/guides/actions/parameters/#whitelisting)
  It returns nill instead. It may lead to save nil values in the database

- Why Repository is a class and not an instance?

## Things I forgot to say in the vim presentation

- Plugin management
- Go to file
- Jump to definition
- Search in project
- Find, replace
- Copy and paste
