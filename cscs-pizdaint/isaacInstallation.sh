

ISAAC_BRANCH="dev-felix-bachelor"

source isaac.profile

set -euf -o pipefail

# create temporary (24 hours) directory for software source files
mkdir -p /dev/shm/$(whoami)/src
export SOURCE_DIR=/dev/shm/$(whoami)/src

# create directory for isaac code
mkdir -p $HOME/src

#   iceT
if [ ! -d $IceT_DIR ]; then
    cd $SOURCE_DIR
    git clone -b IceT-2.1.1 https://gitlab.kitware.com/icet/icet.git \
        $SOURCE_DIR/icet
    mkdir icet-build
    cd icet-build
    cmake -DCMAKE_INSTALL_PREFIX=$HOME/lib/icet-2.1.1 -DICET_USE_OPENGL=OFF\
        $SOURCE_DIR/icet
    make -j4 install
fi

#   jansson
if [ ! -d $Jansson_DIR ]; then
    cd $SOURCE_DIR
    git clone -b 2.11 https://github.com/akheron/jansson.git \
        $SOURCE_DIR/jansson
    mkdir jansson-build
    cd jansson-build
    cmake -DCMAKE_INSTALL_PREFIX=$HOME/lib/jansson-2.11 \
        $SOURCE_DIR/jansson
    make -j4 install
fi

#   libwebsockets
if [ ! -d $Libwebsockets_DIR ]; then
    cd $SOURCE_DIR
    git clone -b v2.4-stable https://github.com/warmcat/libwebsockets.git \
        $SOURCE_DIR/libwebsockets
    mkdir libwebsockets-build
    cd libwebsockets-build
    cmake -DCMAKE_INSTALL_PREFIX=$HOME/lib/libwebsockets-2.4 -DLWS_WITH_SSL=OFF \
        $SOURCE_DIR/libwebsockets
    make -j4 install
fi

#   libjpeg-turbo
if [ ! -d $JPEG_DIR ]; then
    cd $SOURCE_DIR
    git clone -b master https://github.com/libjpeg-turbo/libjpeg-turbo.git \
        $SOURCE_DIR/libjpeg-turbo
    mkdir libjpeg-turbo-build
    cd libjpeg-turbo-build
    cmake -DCMAKE_INSTALL_PREFIX=$HOME/lib/libjpeg-turbo-master -DWITH_SIMD=OFF -DENABLE_SHARED=OFF -DCMAKE_SKIP_INSTALL_RPATH=ON -DCMAKE_SKIP_RPATH=ON \
        $SOURCE_DIR/libjpeg-turbo
    make -j4 install
fi

cd $HOME

# get ISAAC and install Server binary
if [ ! -d $ISAAC_DIR ]; then
    git clone -b $ISAAC_BRANCH https://github.com/FelixTUD/isaac.git \
        $HOME/lib/isaac
    cd $SOURCE_DIR
    mkdir isaacserver-build
    cd isaacserver-build
    export CMAKE_PREFIX_PATH=/users/fmeyer/lib/libjpeg-turbo-master
    cmake -DCMAKE_INSTALL_PREFIX=$HOME -DISAAC_JPEG=OFF\
	$HOME/lib/isaac/server
    make -j4 install
fi
