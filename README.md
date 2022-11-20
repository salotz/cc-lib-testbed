# CC Lib Example Repo

An example of a well structured C/C++ project repository.

I am mostly using this for my own personal learning, reference, and
experimentation with build systems and other matters.

I also use this for adding small snippets and tests of general things.

## Working on the Project

### Tooling Dependencies

For working on the project you will need the following:

- CMake
- Ninja
- Clang
  - clang-tidy
  - clang-check
  - clang-format
- GCC if you wish
- rtags

### Compiling

To build the debug build for development:

```sh
make configure
make build
```

To build the release:

``` sh
make configure-release
make build-release
```

### QA & Formatting

``` sh
make validate
make format

# TODO
# make test
```

## Using the Project

### Build Instructions

If you just want to build and use the software yourself:

- CMake
- C++ Compiler (Clang, GCC, etc.)

Then you will need to configure and build the project. The commands below show
not only the normal process of configuring & building but also how to get a full
listing of all of the build time options available. These should also be
documented, but this is authoritative. The prefix 'THIS_' is used to distinguish
build time arguments which you should tweak as a normal consumer of the library.

``` sh
mkdir -p build

# See which options you want
cmake -B -LAH . | grep 'THIS_'

cmake -B build -DCMAKE_BUILD_TYPE=Release -DTHIS_OPTION1=ON .

cmake --build build

# If you want to have the files installed into a directory:
cmake --install <install-dir>
```
