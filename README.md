# OS_Bash

## Delete (or fake) metadata

**del_metadata.sh**: bash script for deleting metadata (author name; date timestamps) from a docx (Word) document, which is basically a zip file of xml documents. The script modifies document.xml and comments.xml (if present). Metadata in the output file will appear empty (no author), (no date), including comments in the margin which will have no author and no timestamps. 

Usage: ./del_metadata.sh file1.docx 

**del_metadata.py**: python script that does the same as above, however with an additional (mask) option for faking timestamps of comments using numpy. If the mask option is specified, then timestamps of comments in the margin will be faked through randomization: the first will be the current OS datetime, and remaining comments will be assigned timestamps with an incremental component drawn from a uniform distribution so that consecutive comments appear as if anywhere between 1 to 2 minutes apart.      

Usage: ./del_metadata.py -m file1.docx <br>
Usage: ./del_metadata.py file1.docx 

## Download image files from xkcd site

**scrape_imgs.sh**: download all cartoon images from (inaccessible) xkcd.com directory; can be adapted to similar situations. 
Comic cartoons on xkcd.com can be viewed with URL: 

https://xkcd.com/[i]/index.html

where [i] is an integer from 1 to some number (which increases as more cartoons are added over time)

The cartoon image files can be downloaded one at a time by visiting all  consecutive index.html files, however the number of cartoons so far is a few thousands (>4000), and the directory on the web server which holds these images is forbidden: 

https://imgs.xkcd.com/comics/  ->  #403 Forbidden

With no permission to access the directory, its image files can still be downloaded with wget if their filenames are known; so these filenames would first need to be detected, i.e. scraped from index.html files. 

The cartoon images are located at: 

https://imgs.xkcd.com/comics/*.jpg	
or 
https://imgs.xkcd.com/comics/*.png

where * represents some variable filename for each cartoon.

This script fetches index.html files by incrementing [i] in a loop and detecting the URL in the html files pointing to the cartoon image (jpg or png file). The loop increments indefinitely until it fails to find an index.html file for some [i]. The images are stored in a specified directory or by default in ~/Downloads/xkcd_imgs/ 

Usage: ./scrape_xkcd.sh	path_to_directory <br>
       if unspecified, path_to_directory will be default: ~/Downloads/xkcd_imgs/
	
