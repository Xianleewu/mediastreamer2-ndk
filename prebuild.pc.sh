#!/bin/bash


echo configuring....

./configure \
--disable-static \
--enable-shared \
--disable-rpath \
--enable-oss \
--enable-alsa \
--enable-ffmpeg \
--enable-speex \
--disable-glx
