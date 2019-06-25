# !/bin/bash
VERSION=$(cat ./VERSION)

tar zxf *.tar.gz
cd aria2-$(cat ./VERSION)
./configure ARIA2_STATIC=yes