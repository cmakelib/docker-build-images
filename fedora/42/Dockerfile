FROM fedora:42

WORKDIR /root

RUN dnf update -y && \
	dnf -y install git wget lsb_release coreutils make automake gcc gcc-c++

RUN wget https://github.com/Kitware/CMake/releases/download/v4.0.3/cmake-4.0.3-Linux-x86_64.sh && \
    chmod +x cmake-4.0.3-Linux-x86_64.sh && \
    ./cmake-4.0.3-Linux-x86_64.sh --skip-license --prefix=/usr/local