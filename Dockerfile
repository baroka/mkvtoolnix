# build:
#  docker build -t baroka/mkvtoolnix .

FROM alpine:latest

WORKDIR /work

# Copy entrypoint script
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh

# Install packages
RUN apk update && apk add --no-cache inotify-tools mkvtoolnix jq && \
    rm -rf /tmp/*

# Timezone
RUN apk update && apk add tzdata
ARG TZ "Europe/Madrid"
ENV TZ=$TZ
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Create folders
RUN mkdir /home/video
RUN mkdir /home/scripts

# Copy init script
WORKDIR /home/scripts
COPY init.sh .
RUN chmod a+x init.sh

# Run the command on container startup
ENTRYPOINT ["/work/entrypoint.sh"]