#!/bin/bash

cd web-app/

./gradlew  build  

cd ../../

docker build -t amirmamdouh123/ivolve-grad-image . 

