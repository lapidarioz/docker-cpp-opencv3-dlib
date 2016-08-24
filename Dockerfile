FROM philipz/opencv3_python2.7

WORKDIR /usr/src/

# Download dlib on /usr/src/dlib
RUN wget https://github.com/davisking/dlib/archive/v19.0.zip -O dlib.zip && \
    unzip -q dlib.zip && mv dlib-19.0 dlib && rm dlib.zip

RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/app-build
WORKDIR /usr/src/app-build

COPY CMakeLists.txt /usr/src/app/
COPY main.cpp /usr/src/app/

RUN cmake /usr/src/app/
RUN cmake --build /usr/src/app-build --config Release

RUN /usr/src/app-build/dlib-container

WORKDIR /usr/src/app
