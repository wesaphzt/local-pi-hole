#!/bin/bash
#========================================
# Author: wesaphzt
# Local Pi-Hole blocklist
#========================================

HOSTS=/etc/hosts
HOSTSBAK=$HOSTS.bak
PIHOSTS=https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

#------------------------------------------------->
function cmdStatus {
	"$@"
	local status=$?
	if [ $status -ne 0 ]; then
		echo "error" >&2
	fi
	return $status
}
#------------------------------------------------->
#========================================
# checks
#========================================
#----------------------------------------
# root check
#----------------------------------------
if (( $(id -u) != 0 )); then
	echo "not running as root";
	exit 1
else
	echo "running as root";
fi

#========================================
# backup
#========================================
if [[ -f $HOSTS ]]; then
	echo "hosts file exists";
	echo "backing up hosts file to $HOSTSBAK"
	cmdStatus cp $HOSTS $HOSTSBAK;
else
	echo "hosts file doesn't exist"
fi

#========================================
# update
#========================================
echo "dl updated hosts file"
cmdStatus curl -sSL $PIHOSTS > $HOSTS || exit
echo "hosts file updated"

echo "//done"
