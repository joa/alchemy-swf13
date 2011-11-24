#!/bin/bash
mxmlc -compiler.omit-trace-statements=false -compiler.debug=false -swf-version=12 -output 12.swf -- Main.as
mxmlc -compiler.omit-trace-statements=false -compiler.debug=false -swf-version=13 -output 13.swf -- Main.as

