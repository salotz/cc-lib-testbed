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

all: build
.PHONY: all

## General Commands
clean-all: clean clean-release clean-dist
.PHONY: clean-all

## QA

validate:
	find src -name '*.cpp' |  xargs clang-check -p _build
	find ./src -name '*.h' | xargs clang-check -p _build
	find ./src -name '*.cpp' | xargs clang-tidy -p _build
	find ./src -name '*.h' | xargs clang-tidy -p _build
.PHONY: validate

format:
	find ./src -name '*.cpp' | xargs clang-format --style=Mozilla -i
	find ./src -name '*.h' | xargs clang-format --style=Mozilla -i
.PHONY: format


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
	  -DCMAKE_BUILD_TYPE=Debug \
	  -DTHIS_DEBUG=ON
.PHONY: configure

test:
	./_build/test-bed
.PHONY: test

clean:
	rm -rf _build
.PHONY: clean

## Release
#
# Simulation of what installation on the user side would look like when building
# from source

build-release:
	cmake --build _build_release
.PHONY: build-release

configure-release:
	mkdir -p _build_release
	cmake \
	  -B _build_release \
	  -S . \
	  -G Ninja \
	  --install-prefix $(realpath _install) \
	  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	  -DBUILD_SHARED_LIBS=ON \
	  -DCMAKE_BUILD_TYPE=Release
.PHONY: configure

install-release:
	cmake --install _build_release
.PHONY: install-release

test-release:
	./_build_release/test-bed
.PHONY: test

clean-release:
	rm -rf _build_release
.PHONY: clean

## Distribution
#
# Build a pre-compiled distribution that can be just installed on a similar
# system

build-dist:
	cmake --build _build_dist
.PHONY: build-dist

configure-dist:
	mkdir -p _build_dist
	cmake \
	  -B _build_dist \
	  -S . \
	  -G Ninja \
	  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	  -DCMAKE_BUILD_TYPE=RelWithDebInfo
.PHONY: configure

test-dist:
	./_build_dist/test-bed
.PHONY: test

clean-dist:
	rm -rf _build_dist
.PHONY: clean



# end
