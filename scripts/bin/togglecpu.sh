#!/bin/sh

perf=$(cpupower frequency-info | grep "The governor \"performance\"")

if [ -z "$perf" ] ; then
  echo Entering performance mode
  sudo cpupower frequency-set -g performance
else
  echo Entering ondemand mode
  sudo cpupower frequency-set -g ondemand
fi

