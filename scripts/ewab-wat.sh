#!/bin/bash
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

cfile=$1
options=$2
wasmfile=${cfile%.*}.wasm
watfile=${cfile%.*}.wat

includes="-nostdlib -Wl,--no-entry -Wl,--export-all "

clang $coptions $includes --target=wasm32 $options -o "$wasmfile" "$cfile"
if [ $? != 0 ];then
  exit 1
fi

wasm2wat "$wasmfile" > "$watfile"
