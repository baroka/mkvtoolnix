#!/bin/sh
# Entrypoint for mkvtoolnix
echo "init.."

# Monitorize video folder
inotifywait -m -r -e create,moved_to /home/video --includei "\.mkv$"| while read path action file; do
  echo "change detected.. ${path} ${action} ${file}"
  /home/scripts/init.sh ${path}${file}  
done