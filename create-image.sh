#!/bin/bash

rm -rf share/
mkdir -p share
cd share/

export BRANCH="kirkstone"
git clone -b ${BRANCH} git://git.yoctoproject.org/poky.git poky
git clone -b ${BRANCH} https://github.com/OE4T/meta-tegra.git

cd poky/
git apply ../../patches/postinst.patch

cd ../../
chmod -R 777 share/

docker build -t jetson-dev .
