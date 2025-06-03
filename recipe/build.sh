#!/bin/bash

rm -rf build
mkdir build
cd build

# configure
cmake \
	${SRC_DIR} \
	${CMAKE_ARGS} \
	-DCMAKE_BUILD_TYPE:STRING=Release \
	-DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
;

# build
cmake --build . --verbose --parallel ${CPU_COUNT}

# install
cmake --build . --verbose --parallel ${CPU_COUNT} --target install
