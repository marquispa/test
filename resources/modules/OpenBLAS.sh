#!/bin/bash
# Exit immediately on error
set -eu -o pipefail

SOFTWARE=OpenBLAS
VERSION=0.2.17
ARCHIVE=$SOFTWARE-$VERSION.tar.gz
ARCHIVE_URL=https://github.com/xianyi/OpenBLAS/archive/v${VERSION}.tar.gz
SOFTWARE_DIR=$SOFTWARE-$VERSION

# Specific commands to extract and build the software
# $INSTALL_DIR and $INSTALL_DOWNLOAD have been set automatically
# $ARCHIVE has been downloaded in $INSTALL_DOWNLOAD
build() {
  cd $INSTALL_DOWNLOAD
  tar zxvf $ARCHIVE

  cd $SOFTWARE_DIR
  make DYNAMIC_ARCH=1 DYNAMIC_CORE="NEHALEM SANDYBRIDGE BARCELONA ATOM PRESCOTT PENRYN BOBCAT OPTERON NANO CORE2 OPTERON_SSE3 DUNNINGTON" TARGET="BARCELONA" CC=gcc FC=gfortran BINARY=64 NO_AVX=1

  # Install software
  make PREFIX=$INSTALL_DIR/${SOFTWARE_DIR} install
}

module_file() {
echo "\
#%Module1.0
proc ModulesHelp { } {
  puts stderr \"\tMUGQIC - $SOFTWARE \"
}
module-whatis \"$SOFTWARE\"

set             root                $INSTALL_DIR/$SOFTWARE_DIR
prepend-path    PATH                \$root/bin
prepend-path    LD_LIBRARY_PATH     \$root/lib
prepend-path    LIBRARY_PATH        \$root/lib
prepend-path    CPATH               \$root/include
setenv          BLASDIR             \$root/lib

"
}

# Call generic module install script once all variables and functions have been set
MODULE_INSTALL_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $MODULE_INSTALL_SCRIPT_DIR/install_module.sh $@
