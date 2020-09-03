
# load modules
# source $HOME/picongpu.profile

# Project Information ######################################## (edit this line)
#   - project account for computing time
# export proj=<yourProject>

# Text Editor for Tools ###################################### (edit this line)
#   - examples: "nano", "vim", "emacs -nw", "vi" or without terminal: "gedit"
#module load nano
#export EDITOR="nano"

# basic environment ###########################################################
module load gcc/6.4.0

export CC=$(which gcc)
export CXX=$(which g++)

# required tools and libs
module load git
module load cmake/3.15.2
module load cuda/10.1.168
module load boost/1.66.0



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
