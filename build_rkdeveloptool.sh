#!/bin/sh -xe
cd rkdeveloptool/
git reset --hard
git clean -fxd
sed -i '' 's/int nSectorSize = 512;/const int nSectorSize = 512;/g' main.cpp
./autogen.sh
./configure
make
