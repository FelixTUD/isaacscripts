
# load modules
source $HOME/picongpu.profile

module load gdb/8.2

export ISAAC_LIBS="$HOME/lib"

export IceT_DIR=$ISAAC_LIBS/icet-2.1.1
export Jansson_DIR=$ISAAC_LIBS/jansson-2.11
export Libwebsockets_DIR=$ISAAC_LIBS/libwebsockets-2.3
export ISAAC_DIR=$ISAAC_LIBS/isaac

export LD_LIBRARY_PATH=$IceT_DIR/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$Jansson_DIR/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$Libwebsockets_DIR/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$ISAAC_DIR/lib:$LD_LIBRARY_PATH

export CMAKE_PREFIX_PATH=$Jansson_DIR/lib:$CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=$IceT_DIR/lib:$CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=$Libwebsockets_DIR/lib:$CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=$ISAAC_DIR/lib:$CMAKE_PREFIX_PATH

INSTALL_IceT=true
INSTALL_Jansson=true
INSTALL_Libwebsockets=true
INSTALL_JPEG=false
