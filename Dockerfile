FROM resin/aarch64-ubuntu:xenial

RUN [ "cross-build-start" ]

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	wget file \
	cmake \
	build-essential \
	autoconf \
	less \
	libtinyxml2-dev \
	libopencv-dev \
	libgstreamer1.0-dev \
	libgstreamer-plugins-base1.0-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

#ADD pylon_5.1.0.12682-deb0_arm64.deb /
#RUN dpkg -i /pylon_5.1.0.12682-deb0_arm64.deb

#RUN wget https://developer.nvidia.com/embedded/dlc/l4t-gcc-toolchain-64-bit-28-2-ga -O gcc-toolchain.tar.gz \
#    && cd /usr \
#    && tar --strip-components 1 -zxvf /gcc-toolchain.tar.gz \
#    && rm /gcc-toolchain.tar.gz

RUN wget https://github.com/opencv/opencv/archive/3.4.3.tar.gz -O opencv3.4.3.tar.gz \
	&& tar zxvf opencv3.4.3.tar.gz \
	&& mkdir opencv-build \ 
	&& cd opencv-build \
	&& cmake ../opencv-3.4.3 \
	&& make

RUN [ "cross-build-end" ]
