# OS_Bash

**del_metadata.sh**: bash script for deleting metadata (author name; date timestamps) from a docx (Word) document, which is basically a zip file of xml documents. The script modifies document.xml and comments.xml (if present). Metadata in the output file will appear empty (no author), (no date), including comments in the margin which will have no author and no timestamps. 

**del_metadata.py**: python script that does the same as above, however with an additional (mask) option of faking timestamps of comments using numpy. If the mask option is specified, then timestamps of comments in the margin will be faked through randomization: the first will be the current OS datetime, and remaining comments will be assigned timestamps with an incremental component drawn from a uniform distribution so that consecutive comments appear as if anywhere between 1 to 2 minutes apart.      
