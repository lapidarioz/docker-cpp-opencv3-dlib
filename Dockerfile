FROM kavolorn/opencv

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

# Download predictor file
RUN apt-get install -y bzip2 && \
    wget http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2 && \
    bzip2 -d shape_predictor_68_face_landmarks.dat.bz2

RUN /usr/src/app-build/dlib-container
