```shell
Docker image for monitoring a folder and launch custom MKVToolNix script. 

PREREQUISITES
 - Docker installed

INSTALLATION
 - Docker compose example: 

# MKVToolNix
  mkvtoolnix:
    container_name: mkvtoolnix
    image: baroka/mkvtoolnix:latest
    restart: unless-stopped   
    networks:
      - t2_proxy   
    security_opt:
      - no-new-privileges:true   
    volumes:
      - $DOCKERDIR/mkvtoolnix/scripts:/home/scripts
      - $DATADIR/Video/Series/Ver:/home/video
    environment:
      - TZ=$TZ
      - USER_ID=$PGID
      - GROUP_ID=$PUID 

 - $DOCKERDIR points to your local path for script files
```
