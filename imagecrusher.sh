#!/usr/bin/bash
for file in *.png; do
echo $file; pngcrush -rem alla -brute -reduce $file opt-$file | grep 'filesize reduction'
done

for file in *.jpg; do
IMAGESIZE=`stat -c%s $file` 
  if [ "$IMAGESIZE" -lt "10240" ]
    then
      jpegtran -copy none -optimize $file > opt-$file
      echo $file saved as JPEG Baseline
    else
      jpegtran -copy none -optimize -progressive $file > opt-$file
      echo $file saved as JPEG Progressive
  fi
done
