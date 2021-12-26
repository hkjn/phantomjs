FROM debian:bullseye@sha256:2906804d2a64e8a13a434a1a127fe3f6a28bf7cf3696be4223b06276f32f1f2d

WORKDIR /build

COPY ["src/", "./src"]
COPY ["CMakeFiles/", "./CMakeFiles"]
COPY ["CMakeLists.txt", "./"]
COPY ["configure", "./"]
COPY ["examples", "./examples"]

RUN apt update && \
    apt install -y libqt5webkit5-dev g++ cmake

RUN pwd && ls -hsal && \
    ./configure && \
    make

ENTRYPOINT ["/build/bin/phantomjs"]
