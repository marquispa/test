#!/bin/bash
# Exit immediately on error
set -eu -o pipefail

<<<<<<< HEAD


SOFTWARE=scalpel 
VERSION=0.5.2  
ARCHIVE=$SOFTWARE-$VERSION.tar.gz 
ARCHIVE_URL=http://sourceforge.net/projects/${SOFTWARE}/files/${ARCHIVE} 
SOFTWARE_DIR=$SOFTWARE-$VERSION 


build() {
  cd $INSTALL_DOWNLOAD
  tar zxvf $ARCHIVE  

  cd $SOFTWARE_DIR
  make  
  

  # Install software
  cd $INSTALL_DOWNLOAD  ## TO BE ADDED AND MODIFIED IF NECESSARY
  mv -i $SOFTWARE_DIR $INSTALL_DIR/  ## TO BE ADDED AND MODIFIED IF NECESSARY
=======
SOFTWARE=scalpel
VERSION=0.5.2
PERL_VERSION=5.18.2
ARCHIVE=$SOFTWARE-$VERSION.tar.gz
ARCHIVE_URL=http://sourceforge.net/projects/scalpel/files/$ARCHIVE/download
SOFTWARE_DIR=$SOFTWARE-$VERSION

# Specific commands to extract and build the software
# $INSTALL_DIR and $INSTALL_DOWNLOAD have been set automatically
# $ARCHIVE has been downloaded in $INSTALL_DOWNLOAD
build() {
  cd $INSTALL_DOWNLOAD
  tar zxvf $ARCHIVE

  cd $SOFTWARE_DIR
  module load mugqic/perl/$PERL_VERSION
  make

  # Update Perl script shebangs
  sed -i s,"#\!/usr/bin/perl,#\!/usr/bin/env perl,g" *.pl scalpel*
  chmod +x *.pl scalpel*

  # Install software
  cd $INSTALL_DOWNLOAD
  mv -i $SOFTWARE_DIR $INSTALL_DIR/
>>>>>>> 5edde6884a6a5167ae55dfe97c8c6ecfd04e1ce8
}

module_file() {
echo "\
#%Module1.0
proc ModulesHelp { } {
  puts stderr \"\tMUGQIC - $SOFTWARE \"
}
module-whatis \"$SOFTWARE\"

set             root                $INSTALL_DIR/$SOFTWARE_DIR
prepend-path    PATH                \$root
<<<<<<< HEAD
=======
prepend-path    LD_LIBRARY_PATH     \$root/bamtools-2.3.0/lib/
>>>>>>> 5edde6884a6a5167ae55dfe97c8c6ecfd04e1ce8
"
}

# Call generic module install script once all variables and functions have been set
MODULE_INSTALL_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $MODULE_INSTALL_SCRIPT_DIR/install_module.sh $@
