#!/usr/bin/env bash
:'
Download cartoon images from (inaccessible) xkcd directory; 

Usage:  ./scrape_xkcd.sh  [path_local_directory] 

        If unspecified, default [path_local_directory] is ~/Downloads/xkcd_imgs/

ARGS:
        path_local_directory: optional location for storing xkcd images

OUTPUT:

        Image files (*.jpg or *.png) in path_local_directory

DESCRIPTION:

Comic cartoons on xkcd.com can be viewed with URL: 

https://xkcd.com/[i]/index.html

where [i] is an integer from 1 to some number (which increases as more cartoons are added).

The cartoon image files can be downloaded one at a time by visiting all consecutive index.html files, 
however the number of cartoons is in the order of thousands, and the web server directory holding these 
images has no read permission: 

https://imgs.xkcd.com/comics/      #403 Forbidden

With no permission to access the directory, its image files can still be downloaded with wget if their 
filenames are known; hence, the filenames would first need to be discovered, ie scraped from index.html files. 

Observation: inspecting a few index.html files, cartoon images appear to be located at:
 
https://imgs.xkcd.com/comics/*.jpg
https://imgs.xkcd.com/comics/*.png

This script fetches index.html files by looping over [i] and detecting the URL in the html files pointing 
to the cartoon image (jpg or png file). The loop increments indefinitely until it fails to find an index.html 
file for some [i]. The images are stored in a specified directory or by default in ~/Downloads/xkcd_imgs/

J.A., xrzfyvqk_k1jw@pm.me
'

if [ $# = 0 ]; then
    loc="$HOME/Downloads/xkcd_imgs"    
else
    loc=$1
fi

cwd=$(pwd)
cd /tmp

flag=0; i=1
while [ flag=0 ]; do
    echo site_count: $i
    wget "https://xkcd.com/$i/index.html"  
    flag=$?
    wget -P $loc $(grep -o 'Image URL (for hotlinking/embedding): https://imgs.xkcd.com/comics/.*.[jpg|png]' index.html)
    rm /tmp/index.html
    let i++
done

cd "$cwd" 
