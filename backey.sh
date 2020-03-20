#!/bin/bash

CACHE_DIR="$HOME/.cache/backey"
mkdir -p "$CACHE_DIR"

cd "$BACKEY_IMAGE_DIR"

count=1
images=()

while read image
do
  tmp="$count.tmp.jpg"
  images+=("$tmp")
  convert "$image" -geometry "$BACKEY_SCREEN_RESOLUTION^" -gravity center -crop "$BACKEY_SCREEN_RESOLUTION+0+0" "$CACHE_DIR/$tmp"
  count=$((count+1))
done < <(ls *.jpg | shuf -n $BACKEY_NUM_SCREEN)

cd "$CACHE_DIR"

convert "${images[@]}" +append merged.jpg
