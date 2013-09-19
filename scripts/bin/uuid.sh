#!/bin/bash

strings "$@" |grep -A1 UUID|grep -E string|sed -e 's/<[^>]*>//g'

