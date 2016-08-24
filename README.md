# docker-cpp-opencv3-dlib

## BUILD
```
docker build -t cpp-opencv3-dlib .
```
## RUN
```
docker run -ti -v $(pwd):/usr/src/app lapidarioz/docker-cpp-opencv3-dlib /bin/sh
cd /usr/src/app-build
cmake /usr/src/app/
cmake --build /usr/src/app-build --config Release
```
