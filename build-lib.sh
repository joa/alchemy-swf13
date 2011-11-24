#!/bin/bash

APPARAT_HOME=~/Development/apparat-1.0-SNAPSHOT

compc -compiler.debug=false -compiler.library-path ${APPARAT_HOME} -compiler.source-path . -output lib.swc Alc
7z -y x lib.swc
rm lib.swc
rm catalog.xml
${APPARAT_HOME}/tdsi -i library.swf -a -f -e -m -s

