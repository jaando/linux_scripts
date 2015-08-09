#!/bin/bash

SOURCEDIR="$1"
FILELIST="${SOURCEDIR}"/*.pdf
OCRDIR="$1/ocr"
mkdir "$OCRDIR"

#echo "SOURCEDIR= $SOURCEDIR"
#echo "FILELIST= $FILELIST"
#echo "OCRDIR= $OCRDIR"


shopt -s nullglob
for f in $FILELIST
do

#Testprint
#echo "$f"
  echo "Processing $f file..."


	PDFFONTS_OUT="$(pdffonts "$f" 2>/dev/null)"
	RET_PDFFONTS="$?"
	FONTS="$(( $(echo "$PDFFONTS_OUT" | wc -l) - 2 ))"
	if [[ ! "$RET_PDFFONTS" = "0" ]]
  	then
      		READ_ERROR=1
      		echo "Error while reading $FILE. Skipping..."
      		continue
	fi
	if [[ "$FONTS" = "0" ]]
  	then
  		echo "NOT SEARCHABLE: $FILE"
  		#take action on each file. $f store current file name
  		pdfsandwich "$f" -o "$OCRDIR/$f" 
  		echo "Moving $f file..."
  		mv -f "$OCRDIR/$f" "$f"
  		echo "Setting permissions on file $f..."
  		chown web1:client0 "$f"
	else
      		echo "SEARCHABLE: $FILE"
	fi
done

rm -rf "$OCRDIR"

echo "finished"
