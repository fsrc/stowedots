#!/bin/bash

ssh -L32400:10.0.0.120:32400 -L3322:10.0.0.120:22 -N ksite.se &
vimprobable2 http://localhost:32400/web &
ntorrent

