#!/usr/bin/bash
for x in `ls | grep *.png`; do
pngcrush -rem alla -brute -reduce $x opt-$x
done

for x in `ls | grep *.jpg`; do
jpegtran -copy none -optimize $x > opt-$x
done
