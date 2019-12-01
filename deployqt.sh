#!/bin/sh

# before deploying, install required libs
# install same qt version, install xkb, xineram, freetype

set -x

staticsrcpath=/root/qt/qt5static/qt-everywhere-src-5.13.2
staticbuildpath=/root/qt/qt5static/qt5-static-build
appbuildpath=/root/qt/durrrr/static-build
njobs=16

rm -rf $staticbuildpath
rm -rf $appbuildpath

mkdir $staticbuildpath && cd $staticbuildpath && mkdir build && mkdir install && cd build && "$staticsrcpath"/configure -opensource -confirm-license -static -release -prefix "$staticbuildpath"/install -fontconfig -system-freetype -skip webengine -nomake tests -nomake examples && make -j"$njobs" && make install && mkdir $appbuildpath && cd $appbuildpath && "$staticbuildpath"/install/bin/qmake -config release .. && make
