# Mini Projects

## Delete (or fake) metadata

**del_metadata.sh**: bash script for deleting metadata (author name; date timestamps) from a docx (Word) document. Metadata in the output file will appear empty (no author), (no date), including comments in the margin which will have no author and no timestamps. 

**del_metadata.py**: python script that does the same as above, however with an additional (mask) option for faking timestamps of comments using numpy. If the mask option is specified, then timestamps of comments in the margin will be faked through randomization where timestamps are assigned with an incremental component drawn from a uniform distribution.   

## Random web traffic generator

**traffic_gen.sh**: generates random web traffic for obfuscating real traffic while browsing. 

## Scrape image files from xkcd site

**scrape_imgs.sh**: download cartoon images from an (inaccessible) xkcd directory.
	
