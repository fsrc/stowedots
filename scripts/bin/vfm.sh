#!/bin/sh

pref=${PWD##*/}

vifm -c "set vicmd='vim --servername $pref --remote' | only" ./ ./

