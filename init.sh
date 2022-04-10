#!/bin/sh
# Init script
echo "new file.. $1"
mkvmerge -F json --identify "$1" | jq '.tracks[] | select(.type == "subtitles") | select(.properties.language == "spa") | .id, .properties.track_name' | (
  while read id; do
     read track_name
     track_name=${track_name//\"/}
     sub=${1//.mkv/.es-$track_name.srt}
     mkvextract tracks "$1" $id:"$sub"
  done
)