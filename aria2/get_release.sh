# !/bin/bash

URL="https://github.com/aria2/aria2"
VERSION=$(cat ./VERSION)
RELEASE="release-$VERSION"

URL=${URL}/releases/download/${RELEASE}/aria2-${VERSION}

WINDOWS_EXT="-win-64bit-build1.zip"
LINUX_EXT=".tar.gz"

EXT=""

case "$OSTYPE" in
  msys*) EXT=$WINDOWS_EXT ;;
  linux*) EXT=$LINUX_EXT ;;
esac

wget ${URL}${EXT}
