FROM offbytwo/ffmpeg:latest as ffmpeg

FROM ubuntu:bionic
LABEL maintainer "Hugo Slepicka <hhslepicka@gmail.com>"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get upgrade -y && \
    apt-get -y install --no-install-recommends \
    libnuma1 \
    libssl1.1 \
    libfreetype6 \
    libxcb1 \
    && apt-get -y clean && rm -r /var/lib/apt/lists/*

WORKDIR /opt/ffmpeg
COPY --from=ffmpeg /opt/ffmpeg /opt/ffmpeg

ENV PATH /opt/ffmpeg/bin:$PATH
RUN ln -s /opt/ffmpeg/share/model /usr/local/share/
RUN ldconfig

COPY stream_youtube /usr/bin/stream_youtube
RUN chmod +x /usr/bin/stream_youtube

WORKDIR /stream