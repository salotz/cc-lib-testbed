##
# Tasks for maintaining the project. This is not the actual build system script.
#
# @file
# @version 0.1

## General Configuration

# this example is clang focused because it provides better tooling. You could
# also do a gcc build but it would require adapting a few things.
CXX=clang++
CC=clang
# CXX=g++
# CC=gcc


## General Commands
clean-all: clean clean-release
.PHONY: clean-all


## Debug
#
# By default these commands build in Debug mode since they are meant to be used
# during the development process. Release builds have specially named commands.

build:
	cmake --build _build
	# load the compilation database etc. to the rtags DB
	rc -J _build
.PHONY: build

configure:
	mkdir -p _build
	cmake \
	  -B _build \
	  -S . \
	  -G Ninja \
	  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	  -DCMAKE_BUILD_TYPE=Debug
.PHONY: configure

clean:
	rm -rf _build
.PHONY: clean

## Release
build-release:
	cmake --build _build_release
.PHONY: build-release

configure-release:
	mkdir -p _build_release
	cmake \
	  -B _build_release \
	  -S . \
	  -G Ninja \
	  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	  -DCMAKE_BUILD_TYPE=Release
.PHONY: configure

clean-release:
	rm -rf _build_release
.PHONY: clean

# end