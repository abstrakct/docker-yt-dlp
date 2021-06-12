FROM python:buster

RUN apt-get -y update && \
    apt-get install -y ffmpeg bash python3 python3-pip &&\
    apt-get -y update && \
    apt-get clean all && \
    python3 -m pip install --upgrade git+https://github.com/yt-dlp/yt-dlp.git@release && \
    python3 -m pip install apprise

RUN mkdir /downloads

WORKDIR /downloads

ADD run-youtube-dl.sh /run-youtube-dl.sh
ADD do-notify.sh /do-notify.sh
RUN chmod +x /run-youtube-dl.sh && chmod +x /do-notify.sh

CMD /run-youtube-dl.sh
