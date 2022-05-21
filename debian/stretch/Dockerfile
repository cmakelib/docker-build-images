FROM debian:stretch


WORKDIR /root

RUN apt-get update && \
    apt-get upgrade -y && \
	apt-get -y install git p7zip-full wget lsb-release coreutils build-essential && \
	rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Kitware/CMake/releases/download/v3.18.5/cmake-3.18.5-Linux-x86_64.sh && \
    chmod +x cmake-3.18.5-Linux-x86_64.sh && \
    ./cmake-3.18.5-Linux-x86_64.sh --skip-license --prefix=/usr/local
