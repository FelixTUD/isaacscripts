

ISAAC_BRANCH="dev"

source isaac.profile

set -euf -o pipefail

# create directory for isaac code
export ISAAC_SRC=$HOME/src/
mkdir -p $ISAAC_SRC

# create temporary (24 hours) directory for software source files
export SOURCE_DIR=$ISAAC_SRC
export LIB_DIR=$HOME/lib/
mkdir -p $SOURCE_DIR


#   iceT
if [ "$INSTALL_IceT" = true ] && [ ! -d $IceT_DIR ]; then
    git clone -b IceT-2.1.1 https://gitlab.kitware.com/icet/icet.git \
        $SOURCE_DIR/icet
    cd $SOURCE_DIR/icet
    mkdir .build
    cd .build
    cmake -DCMAKE_INSTALL_PREFIX=$LIB_DIR/icet-2.1.1 \
        $SOURCE_DIR/icet
    make -j4 install
fi

#   jansson
if [ "$INSTALL_Jansson" = true ] && [ ! -d $Jansson_DIR ]; then
    git clone -b 2.11 https://github.com/akheron/jansson.git \
        $SOURCE_DIR/jansson
    cd $SOURCE_DIR/jansson
    mkdir .build
    cd .build
    cmake -DCMAKE_INSTALL_PREFIX=$LIB_DIR/jansson-2.11 \
        $SOURCE_DIR/jansson
    make -j4 install
fi

#   libwebsockets
if [ "$INSTALL_Libwebsockets" = true ] && [ ! -d $Libwebsockets_DIR ]; then
    git clone -b v4.0-stable https://github.com/warmcat/libwebsockets.git \
        $SOURCE_DIR/libwebsockets
    cd $SOURCE_DIR/libwebsockets
    mkdir .build
    cd .build
    cmake -DCMAKE_INSTALL_PREFIX=$LIB_DIR/libwebsockets-2.3 \
        $SOURCE_DIR/libwebsockets
    make -j4 install
fi

#   libjpeg-turbo
if [ "$INSTALL_JPEG" = true ] && [ ! -d $JPEG_DIR ]; then
    git clone -b master https://github.com/libjpeg-turbo/libjpeg-turbo.git \
        $SOURCE_DIR/libjpeg-turbo
    cd $SOURCE_DIR/libjpeg-turbo
    mkdir .build
    cd .build
    cmake -DCMAKE_INSTALL_PREFIX=$LIB_DIR/libjpeg-turbo-master \
        $SOURCE_DIR/libjpeg-turbo
    make -j4 install
fi

cd $HOME

# get ISAAC and install Server binary
if [ ! -d $ISAAC_DIR ]; then
    git clone -b $ISAAC_BRANCH git@github.com:ComputationalRadiationPhysics/isaac.git \
        $LIB_DIR/isaac
    cd $LIB_DIR/isaac
    mkdir .build
    cd .build
    cmake -DCMAKE_INSTALL_PREFIX=$HOME \
	$LIB_DIR/isaac/server
    make -j4 install
fi
