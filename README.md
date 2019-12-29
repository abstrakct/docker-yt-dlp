# youtube-dl
Docker container for automatically backing up channels on any site supported by youtube-dl.

forked from timlinden

Optional environment variable 'DOWNLOAD_RATE' will set maximum download rate. See youtube-dl manpage for details.

Optional environment variable 'DOWNLOAD_SUBS' - set to 'yes' (default value) to download and embed any subtitles. Set to 'no' to ignore subtitles.

Example docker-compose entry:

```
youtube-dl:
  image: vortexsurfer/youtube-dl
  container_name: youtube-dl
  environment:
    - DOWNLOAD_RATE=500K
  volumes:
    - /path/to/download/directory:/downloads
  restart: unless-stopped
```

Videos will be downloaded to the /downloads directory. Put all the channels you want to automatically download in a file named channels.txt in the /downloads directory. See youtube-dl manpage for details.
