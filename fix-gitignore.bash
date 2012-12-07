#!/bin/bash

cd ~
rm -Rf t
mkdir t
cd t

echo Creating dummy app to copy template WEB-INF files from
grails create-app t

echo Copying
cp -R ~/t/t/web-app/WEB-INF ~/eRegister/web-app

echo Removing incorrect lines from .gitignore
cd ~/eRegister
vi .gitignore <<heredoc
:3d
:3d
:wq
heredoc


echo Commit
git add web-app/WEB-INF
git commit -a -m "Added missing WEB-INF"
git push

echo Cleaning up
cd
rm -Rf t
