#!/bin/bash

# check we are root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#
# be sure to first run
#
# 	bash build_01.sh
# 	bash build_02.sh
#

# adjust ssh properties as azure requires
pushd appliance/azure
bash 01_adjust.sh
popd

# set new license
if [ -f license.pem ]; then
    sudo -u proxy cp license.pem /opt/dnssafety/etc/license.pem
fi

# tell 
echo "SUCCESS"
echo "SUCCESS"
echo "SUCCESS --- Azure BYOL instance is ready ---"
cat /opt/dnssafety/etc/license.pem | grep "Not After"
echo "SUCCESS"
echo "SUCCESS"
