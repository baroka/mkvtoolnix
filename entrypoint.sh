#!/bin/sh
# Entrypoint for mkvtoolnix
echo "init.."

# Monitorize video folder
inotifywait -m -r -e create,moved_to /home/video --includei "\.mkv$" --format %w%f | while read line; do
  echo "change detected.. ${line}"
  /home/scripts/init.sh "${line}"
done