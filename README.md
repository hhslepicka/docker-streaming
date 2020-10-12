Streaming Docker
================

This container offers FFMPEG and also a wrapper `stream_youtube` which can stream
the content of a Display to Youtube.

Configuration
-------------

Configuration for the `stream_youtube` script are passed via Environment Variables.

Below are the parameters accepted and their default values:

| Parameter    | Default                         | Description                                                                                                                                                                                                    |
|--------------|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| YOUTUBE_URL  | rtmp://a.rtmp.youtube.com/live2 | The stream URL provided by Youtube.                                                                                                                                                                            |
| YOUTUBE_KEY  |                                 | The stream key provided by Youtube.                                                                                                                                                                            |
| VIDEO_SOURCE | :99.0+0,0                       | The video source (display) to be used for capture for the stream.                                                                                                                                              |
| VIDEO_RES    | 1920x1080                       | The video resolution in pixels. It must match the resolution from VIDEO_SOURCE.                                                                                                                                |
| AUDIO_SOURCE | anullsrc                        | The audio source to be used as background audio. If passing a MP3 file,  the folder where the MP3 file lives must be shared with the container. By default the container uses "anullsrc" which means no audio. |

Obtaining the Container
-----------------------

The container is available via DockerHub and can be obtained via:

```shell script
docker pull hhslepicka/streaming
```

Starting the Container
----------------------

The example below will start the container in `daemon` mode, streaming the display `:99.0`
using as background audio `my_song.mp3`.

```shell script
docker run -d --rm \
       -e DISPLAY=":99.0" \
       -e YOUTUBE_KEY="YOUR KEY HERE" \
       -e AUDIO_SOURCE="my_song.mp3" \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v "/path/to/my_song_folder":/stream \
       hhslepicka/streaming \
       stream_youtube
```

Building the Container
----------------------

```shell script
docker build -t hhslepicka/streaming .
```