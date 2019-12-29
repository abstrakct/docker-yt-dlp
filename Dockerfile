FROM python:alpine

RUN pip install youtube-dl
RUN apk add --no-cache ffmpeg

RUN mkdir /downloads

WORKDIR /downloads

ADD run-youtube-dl.sh /run-youtube-dl.sh
RUN chmod +x /run-youtube-dl.sh
CMD /run-youtube-dl.sh
