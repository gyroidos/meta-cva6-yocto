#!/bin/bash
# Bootstrapper for buildbot slave

DIR="build"
MACHINE="cv32a6-genesys2"
CONFFILE="conf/local.conf"
BITBAKEIMAGE="core-image-full-cmdline"

# make sure sstate is there
#echo "Creating sstate directory"
#mkdir -p ~/sstate/$MACHINE

# fix permissions set by buildbot
#echo "Fixing permissions for buildbot"
#umask -S u=rwx,g=rx,o=rx
#chmod -R 755 .

# fix the configuration
if [ -e $CONFFILE ]; then
    rm -rf $CONFFILE
fi

# bootstrap OE
echo "Init OE and creating local.conf"
export BASH_SOURCE="openembedded-core/oe-init-build-env"
. ./poky/oe-init-build-env $DIR

# Symlink the cache
#echo "Setup symlink for sstate"
#ln -s ~/sstate/${MACHINE} sstate-cache

echo "To build an image run"
echo "---------------------------------------------------"
echo "MACHINE=cv64a6-genesys2 bitbake core-image-minimal"
echo "---------------------------------------------------"
echo ""
echo "Buildable machine info"
echo "---------------------------------------------------"
echo "* cv64a6-genesys2: The OpenHW CV64A6 SoC on Genesys2"
echo "* cv32a6-genesys2: The OpenHW CV32A6 SoC on Genesys2"
echo "---------------------------------------------------"

# start build
#echo "Starting build"
#bitbake $BITBAKEIMAGE

