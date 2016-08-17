#
## Android.mk -Android build script-
##
##
## Copyright (C) 2010  Belledonne Communications, Grenoble, France
##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation; either version 2 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU Library General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program; if not, write to the Free Software
##  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
##

LOCAL_PATH:= $(call my-dir)/src
include $(CLEAR_VARS)


MEDIASTREAMER2_INCLUDES := \
	$(LOCAL_PATH)/base \
	$(LOCAL_PATH)/utils \
	$(LOCAL_PATH)/voip \
	$(LOCAL_PATH)/audiofilters \
	$(LOCAL_PATH)/otherfilters \
	$(LOCAL_PATH)/videofilters \
	$(LOCAL_PATH)/.. \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../../oRTP \
	$(LOCAL_PATH)/../../oRTP/include \
	$(LOCAL_PATH)/../../mbedtls/include

LOCAL_MODULE := libmediastreamer2

LOCAL_SRC_FILES = \
	audiofilters/alaw.c \
	audiofilters/audiomixer.c \
	audiofilters/devices.c \
	audiofilters/dtmfgen.c \
	audiofilters/equalizer.c \
	audiofilters/flowcontrol.c \
	audiofilters/g711.c \
	audiofilters/genericplc.c \
	audiofilters/l16.c \
	audiofilters/msfileplayer.c \
	audiofilters/msfilerec.c \
	audiofilters/msg722.c \
	audiofilters/msvaddtx.c \
	audiofilters/msvolume.c \
	audiofilters/tonedetector.c \
	audiofilters/ulaw.c \
	base/eventqueue.c \
	base/mscommon.c \
	base/msfactory.c \
	base/msfilter.c \
	base/msqueue.c \
	base/mssndcard.c \
	base/msticker.c \
	base/msvideopresets.c \
	base/mswebcam.c \
	base/mtu.c \
	crypto/dtls_srtp.c \
	crypto/ms_srtp.c \
	crypto/zrtp.c \
	otherfilters/itc.c \
	otherfilters/join.c \
	otherfilters/tee.c \
	otherfilters/void.c \
	otherfilters/msrtp.c \
	utils/audiodiff.c \
	utils/dsptools.c \
	utils/g722_decode.c \
	utils/g722_encode.c \
	utils/kiss_fft.c \
	utils/kiss_fftr.c \
	utils/msjava.c \
	utils/stream_regulator.c \
	voip/audioconference.c \
	voip/audiostream.c \
	voip/bitratecontrol.c \
	voip/bitratedriver.c \
	voip/ice.c \
	voip/mediastream.c \
	voip/msmediaplayer.c \
	voip/msvoip.c \
	voip/qosanalyzer.c \
	voip/qualityindicator.c \
	voip/ringstream.c \
	voip/stun.c \
	voip/stun_udp.c \
	voip/rfc4103_textstream.c


LOCAL_STATIC_LIBRARIES += \
	libpolarssl

#LOCAL_CFLAGS += -DHAVE_POLARSSL_SSL_H -DHAVE_DTLS=1

LOCAL_STATIC_LIBRARIES :=

LOCAL_CFLAGS += -D_XOPEN_SOURCE=600 -UANDROID -DNO_FFMPEG -DVIDEO_ENABLED

_BUILD_VIDEO := 1

ifeq ($(_BUILD_VIDEO),1)
LOCAL_SRC_FILES += \
	voip/video_preset_high_fps.c \
	voip/videostarter.c \
	voip/videostream.c \
	voip/rfc3984.c \
	voip/layouts.c \
	videofilters/pixconv.c  \
	videofilters/sizeconv.c \
	videofilters/mire.c \
	videofilters/msv4l2.c \

LOCAL_CFLAGS += -DHAVE_LINUX_VIDEODEV2_H=1

LOCAL_CFLAGS += -DVIDEO_ENABLED
LOCAL_SRC_FILES+= \
	voip/scaler.c \
	voip/msvideo.c

endif #_BUILD_VIDEO

ifeq ($(BUILD_NON_FREE_CODECS),1)
LOCAL_CFLAGS += -DHAVE_NON_FREE_CODECS=1
else
LOCAL_CFLAGS += -DHAVE_NON_FREE_CODECS=0
endif

LOCAL_CFLAGS += \
	-UHAVE_CONFIG_H \
	-include $(LOCAL_PATH)/../libmediastreamer2_AndroidConfig.h \
	-DMS2_INTERNAL \
	-DMS2_FILTERS \
	-D_POSIX_SOURCE

LOCAL_CFLAGS += -DDEBUG

LOCAL_C_INCLUDES += \
	$(MEDIASTREAMER2_INCLUDES)

LOCAL_SHARED_LIBRARIES += \
	libortp

LOCAL_CPPFLAGS = $(LOCAL_CLFAGS)

include $(BUILD_SHARED_LIBRARY)
