FROM fedora:41

WORKDIR /root

RUN dnf update -y && \
	dnf -y install git wget lsb_release coreutils make automake gcc gcc-c++

RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.6/cmake-3.21.6-Linux-x86_64.sh && \
    chmod +x cmake-3.21.6-Linux-x86_64.sh && \
    ./cmake-3.21.6-Linux-x86_64.sh --skip-license --prefix=/usr/local