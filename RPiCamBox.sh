#!/bin/bash
basedir=/var/www/html
mediadir=$basedir/media/
h264backup=/var/www/html/h264
filesh264=$basedir/media/*.h264


#check if folders exist
if [ ! -d $h264backup ]
then
  echo "Creating new backup folder"
  mkdir $h264backup || exit -1
fi

for f in $filesh264
do
  echo "Processing file $f..."
  # take action on each file. $f store current file name
  #cat $f
  filename=$(basename -- "${f%.*}")
  #echo $filename
  if ( MP4Box -add $mediadir/$filename.h264 $mediadir/$filename.mp4 )
  then
    #mv $mediadir/$filename.h264 $h264backup/$filename.h264
    cp $mediadir/$filename.h264 $h264backup/$filename.h264
    echo "File copied to backup"
  else
    exit -1
  fi
  exit 100
done


#TODO: Check if running under sudo
#is_user_root ()
#{
#    [ ${EUID:-$(id -u)} -eq 0 ]
#}
