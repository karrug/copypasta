  mkdir AppDir
  mkdir AppDir/bin
  mkdir AppDir/data
  
  cp $INSTALLDIR/app AppDir/bin
  cp -r $INSTALLDIR/data AppDir
  cp `ldd AppDir/bin/app | grep -o '\W/[^ ]*'` AppDir/bin
  
  cat << "EOF" > AppDir/app
  #!/bin/bash
  SCRIPT_PATH=$(dirname $(readlink -f $0))
  $SCRIPT_PATH/bin/ld-*.so.2 --library-path $SCRIPT_PATH/bin $SCRIPT_PATH/bin/app $* 
  EOF
