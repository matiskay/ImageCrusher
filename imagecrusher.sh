#!/usr/bin/bash
for x in `ls | grep .png`; do
echo $x; pngcrush -rem alla -brute -reduce $x opt-$x | grep 'filesize reduction'
done

for x in `ls | grep .jpg`; do
PESO=`stat -c%s $x` 
  if [ "$PESO" -lt "10240" ]
    then
      jpegtran -copy none -optimize $x > opt-$x
      echo $x saved as JPEG Baseline
    else
      jpegtran -copy none -optimize -progressive $x > opt-$x
      echo $x saved as JPEG Progressive
  fi
done
