#!/bin/bash
basedir=/var/www/html
FILES=$basedir/h264/*.h264
for f in $FILES
do
  #echo "Processing $f file..."
  # take action on each file. $f store current file name
  #cat $f
  filename=$(basename -- "${f%.*}")
  #echo $filename
  MP4Box -add $basedir/h264/$filename.h264 $basedir/h264conv/$filename.mp4
done
