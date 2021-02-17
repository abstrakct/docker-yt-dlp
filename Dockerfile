FROM python:alpine

RUN pip install --upgrade yt-dlp apprise
RUN apk add --no-cache ffmpeg bash

RUN mkdir /downloads

WORKDIR /downloads

ADD run-youtube-dl.sh /run-youtube-dl.sh
ADD do-notify.sh /do-notify.sh
RUN chmod +x /run-youtube-dl.sh
RUN chmod +x /do-notify.sh

CMD /run-youtube-dl.sh
