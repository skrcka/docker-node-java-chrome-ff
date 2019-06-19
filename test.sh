#!/bin/bash
jv=$(java -version 2>&1 | head -1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1)
ff=$(firefox -version 2>&1 | head -1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1 | sed '/Mozilla Firefox /s///')

if [ $jv -ge 8 ] && [ $ff -ge 66 ]; then
    echo ok
    exit 0
else
    echo not ok
    exit 1
fi