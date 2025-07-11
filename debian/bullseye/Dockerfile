FROM debian:bullseye

WORKDIR /root

RUN apt-get update && \
    apt-get upgrade -y && \
	apt-get -y install git wget lsb-release coreutils build-essential && \
	rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Kitware/CMake/releases/download/v4.0.3/cmake-4.0.3-Linux-x86_64.sh && \
    chmod +x cmake-4.0.3-Linux-x86_64.sh && \
    ./cmake-4.0.3-Linux-x86_64.sh --skip-license --prefix=/usr/local
