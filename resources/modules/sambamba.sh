#!/bin/bash
# Exit immediately on error
set -eu -o pipefail

SOFTWARE=sambamba
VERSION=0.6.6
ARCHIVE=${SOFTWARE}_v${VERSION}_linux.tar.bz2
ARCHIVE_URL=https://github.com/lomereiter/${SOFTWARE}/releases/download/v${VERSION}/$ARCHIVE
SOFTWARE_DIR=${SOFTWARE}-${VERSION}

build() {
  cd $INSTALL_DOWNLOAD
  tar -xjf sambamba_v${VERSION}_linux.tar.bz2
  mkdir $SOFTWARE_DIR 
  mv ${SOFTWARE}_v${VERSION} $SOFTWARE_DIR

  mv -i $SOFTWARE_DIR $INSTALL_DIR/$SOFTWARE_DIR
  cd $INSTALL_DIR/$SOFTWARE_DIR
  ln -s sambamba* sambamba
}

module_file() {
echo "\
#%Module1.0
proc ModulesHelp { } {
  puts stderr \"\tMUGQIC - $SOFTWARE \"
}
module-whatis \"$SOFTWARE\"

set             root                $INSTALL_DIR/$SOFTWARE_DIR
prepend-path    PATH                \$root ; 
setenv          SAMBAMBA_HOME       \$root ;
"
}

# Call generic module install script once all variables and functions have been set
MODULE_INSTALL_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $MODULE_INSTALL_SCRIPT_DIR/install_module.sh $@
