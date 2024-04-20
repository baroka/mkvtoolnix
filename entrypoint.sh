#!/bin/sh
# Entrypoint for mkvtoolnix
echo "mkvtoolnix start.."

# Monitorize video folder
inotifywait -m -r -e create,moved_to /home/video --includei "\.mkv$|\/[^.]*$" --format %w%f | while read line; do  
  if [ -d "${line}" ]
  then
    echo "directory. change detected.. ${line}"
    sleep 3

  else
    echo "mkv. change detected.. ${line}"
    /home/scripts/init.sh "${line}"
  fi
done