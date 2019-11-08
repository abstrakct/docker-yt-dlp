#!/bin/sh

filename='channels.txt'
echo Start
while read p; do 
    youtube-dl -f best -ciw -o "/download/%(channel_id)s/%(title)s.%(ext)s" -v https://www.youtube.com/channel/$p
done < $filename