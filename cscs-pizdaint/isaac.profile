
# get PIConGPU profile
if [ ! -f $SCRATCH/picongpu.profile ]; then
    wget -O $SCRATCH/picongpu.profile \
        https://raw.githubusercontent.com/ComputationalRadiationPhysics/picongpu/dev/etc/picongpu/pizdaint-cscs/picongpu.profile.example
fi

# load modules
source $SCRATCH/picongpu.profile

CRAYENV_FOUND=$(module li 2>&1 | grep "PrgEnv-cray" > /dev/null && { echo 0; } || { echo 1; })
if [ $CRAYENV_FOUND -eq 0 ]; then
    module swap PrgEnv-cray PrgEnv-gnu/6.0.4
else
    module load PrgEnv-gnu/6.0.4
fi
export CRAY_CPU_TARGET=x86-64

export CC=$(which cc)
export CXX=$(which CC)

module load CMake/3.10.1

module load cray-mpich/7.6.0
module load cray-hdf5-parallel/1.10.0.3

export ISAAC_LIBS="$HOME/lib"

export BOOST_ROOT=$ISAAC_LIBS/boost-1.62.0
export IceT_DIR=$ISAAC_LIBS/icet-2.1.1
export Jansson_DIR=$ISAAC_LIBS/jansson-2.11
export Libwebsockets_DIR=$ISAAC_LIBS/libwebsockets-2.4
export JPEG_DIR=$ISAAC_LIBS/libjpeg-turbo-master
export ISAAC_DIR=$ISAAC_LIBS/isaac

export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$IceT_DIR/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$Jansson_DIR/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$Libwebsockets_DIR/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$JPEG_DIR/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$ISAAC_DIR/lib:$LD_LIBRARY_PATH
