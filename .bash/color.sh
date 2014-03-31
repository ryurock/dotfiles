#!/usr/bin/env bash
#
set -e

if [ -d ~/.bash/ ] ; then
  for file in `ls ~/.bash/*.sh`
  do
    source "${file}"
  done
fi

