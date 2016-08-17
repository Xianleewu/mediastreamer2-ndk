#!/bin/bash


echo configuring....

./configure \
--prefix=/usr/local/mediastreamer2s \
--enable-static \
--disable-shared \
--disable-rpath \
--enable-oss \
--enable-alsa \
--disable-video \
--disable-ffmpeg \
--disable-speex \
--disable-glx
