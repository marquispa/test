#!/bin/bash
# Exit immediately on error
set -eu -o pipefail

SOFTWARE=snap
#VERSION=2013-11-29
VERSION=0.15
ARCHIVE=$SOFTWARE-$VERSION.tar.gz
ARCHIVE_URL=https://github.com/amplab/$SOFTWARE/archive/v${VERSION}.tar.gz
#ARCHIVE_URL=http://korflab.ucdavis.edu/Software/$ARCHIVE
SOFTWARE_DIR=$SOFTWARE-$VERSION

build() {
  cd $INSTALL_DOWNLOAD
  tar zxvf $ARCHIVE

  cd $SOFTWARE_DIR
  make
#  ln -s snap-aligner snap

  # Install software
  cd $INSTALL_DOWNLOAD
  mv -i $SOFTWARE_DIR $INSTALL_DIR/
}

module_file() {
echo "\
#%Module1.0
proc ModulesHelp { } {
  puts stderr \"\tMUGQIC - $SOFTWARE \"
}
module-whatis \"$SOFTWARE\"  
                      
set             root            $INSTALL_DIR/$SOFTWARE_DIR
prepend-path    PATH            \$root
"
}

# Call generic module install script once all variables and functions have been set
MODULE_INSTALL_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $MODULE_INSTALL_SCRIPT_DIR/install_module.sh $@
