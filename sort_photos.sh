#!/bin/bash
: ${PHOTO_DEST?"Need a destination for the photos"}

SEARCH_DIR=$1

if [ -z "$SEARCH_DIR" ]; then
    echo "Need a argument for the search folder for the photos"
    exit 1
fi  


FIND=".*/.*\.\(mov\|MOV\|mp4\|MP4\|avi\|AVI\|jpg\|JPG\)"

echo Searching $SEARCH_DIR
find $SEARCH_DIR -type f -regex $FIND -print0| while read -d '' -r file 
do 
	line=$(ls -l --time-style="+%b %d %Y" "$file") 
	month=$(echo $line | cut -d ' ' -f6)
	year=$(echo $line | cut -d ' ' -f8)

	folder=$PHOTO_DEST/P_$year/$month
	mkdir -p $folder
	cp -n "$file" $folder
	echo -n .
done
echo
echo Done!
