#!/bin/bash

# Add the debian non-free repositories to the /etc/apt/sources.list file. The sun JDK comes from the
# non-free repository, so we add that as a source

apt-get update

apt-get install git make gcc-4.3 linux-headers-`uname -r` build-essential xserver-xorg-input-vmmouse xserver-xorg-video-vmware <<!!!
Y
!!!
