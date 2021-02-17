#FROM python:alpine
FROM frolvlad/alpine-glibc

ENV PYTHON_GET_PIP_URL https://raw.githubusercontent.com/pypa/get-pip/4be3fe44ad9dedc028629ed1497052d65d281b8e/get-pip.py

RUN apk add --no-cache ffmpeg bash gcc python3

# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config

# TODO: check sha256 checksum before running get-pip
RUN wget -O get-pip.py "$PYTHON_GET_PIP_URL"; \
    python3 get-pip.py \
        --disable-pip-version-check \
        --no-cache-dir \
        "pip==21.0.1"; \
    pip --version; \
    find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests -o -name idle_test \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' +; \
	rm -f get-pip.py


RUN pip install yt-dlp apprise

RUN mkdir /downloads

WORKDIR /downloads

ADD run-youtube-dl.sh /run-youtube-dl.sh
ADD do-notify.sh /do-notify.sh
RUN chmod +x /run-youtube-dl.sh
RUN chmod +x /do-notify.sh

CMD /run-youtube-dl.sh
