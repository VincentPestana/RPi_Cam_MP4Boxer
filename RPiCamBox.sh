#!/bin/bash
basedir=/var/www/html
mediadir=$basedir/media
h264backup=/var/www/html/h264
filesh264=$basedir/media/*.h264

#check if folders exist
if [ ! -d $h264backup ]
then
  echo "Creating new backup folder"
  mkdir $h264backup || exit -1
fi

echo "Files to process: $filesh264";

for f in $filesh264
do
  # take action on each file. $f store current file name
  echo "Processing file $f..."
  #echo "Processing [current number]/$filesh264 - $f";
  filename=$(basename -- "${f%.*}")
  if ( MP4Box -add $mediadir/$filename.h264 $mediadir/$filename.mp4 )
  then
    mv $mediadir/$filename.h264 $h264backup/$filename.h264
    #cp $mediadir/$filename.h264 $h264backup/$filename.h264
    echo "File moved to backup"
  fi
done


#TODO: Check if running under sudo
#is_user_root ()
#{
#    [ ${EUID:-$(id -u)} -eq 0 ]
#}
