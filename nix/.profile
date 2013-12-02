#!/bin/sh

if [ -z "${HOSTNAME}" ]
then
  HOSTNAME=`uuname -l`
fi
PS1="${HOSTNAME}:\${PWD} \$ "
EDITOR=vi
PAGER=less
SHELL=`which bash`

export PATH HOSTNAME EDITOR PAGER PS1 SHELL

stty erase \^\h kill \^u intr \^c	# workstations
stty echoe echok ixon ixoff -ixany

# host-specific profile
hostname=`hostname`
#if [ -z "${hostname##localdev*}" ]
#then
#    . /opt/etc/profile
#fi

#vi key bindings
set -o vi

#start bash shell
exec bash
