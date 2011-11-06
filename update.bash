#!/bin/bash

# Add the debian non-free repositories to the /etc/apt/sources.list file. The sun JDK comes from the
# non-free repository, so we add that as a source

echo "" >> /etc/apt/sources.list
echo "deb http://ftp.uk.debian.org/debian/ squeeze main non-free" >> /etc/apt/sources.list
echo "deb-src http://ftp.uk.debian.org/debian/ squeeze main non-free" >> /etc/apt/sources.list

echo "" >> /etc/apt/sources.list
echo "deb http://security.debian.org/ squeeze/updates main non-free" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/ squeeze/updates main non-free" >> /etc/apt/sources.list

# Adding the non-free repository to /etc/apt/sources.list does not automatically re-load the
# packages available from the new repositort. So we issue the apt-get update command to read any new
# packages. If we were to issue the "apt-get install" command without doing this, apt would report
# no matching packages for sun-java6-jdk

apt-get update

# there are some great tips for automated installs of the SUN JDK from robert maldons blog, here is the page
# http://robertmaldon.blogspot.com/2011/08/installing-sun-oracle-jdk-on-ubuntu.html
# That talks about how to turn off the annoying sun jdk license prompt

echo "Accepting the sun jdk6 license...."
echo sun-java6-jdk shared/accepted-sun-dlj-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo sun-java6-jre shared/accepted-sun-dlj-v1-1 select true | sudo /usr/bin/debconf-set-selections

# Use a "Here document" to redirect the text appearing between the !!!s as the standard input
# for the apt-get command. Essentially saving the user the need to type "Y<enter>"

apt-get install git sun-java6-jdk <<!!!
Y
!!!

