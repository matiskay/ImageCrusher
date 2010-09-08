#!/usr/bin/bash
for x in `ls`; do
pngcrush -rem alla -brute -reduce $x opt-$x
done
