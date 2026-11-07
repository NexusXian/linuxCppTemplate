
## Quick Start

### Environment Requirements

- Unix/Linux system
- CMake >= 3.21
- GCC or Clang, supporting C++17 standard
- [vcpkg](https://github.com/microsoft/vcpkg), with `VCPKG_ROOT` pointing to its checkout:

```bash
git clone https://github.com/microsoft/vcpkg.git ~/vcpkg
~/vcpkg/bootstrap-vcpkg.sh
export VCPKG_ROOT=~/vcpkg
```

### Dependencies

Third-party dependencies are managed by vcpkg in manifest mode (see `vcpkg.json`). `fmt` is included as an example.

To add a dependency, edit `vcpkg.json`:

```json
"dependencies": [
  "fmt",
  "spdlog"
]
```

Then in `CMakeLists.txt`:

```cmake
find_package(spdlog CONFIG REQUIRED)
target_link_libraries(main PRIVATE spdlog::spdlog)
```

### Compilation Steps

```bash
# Clone the project
git clone https://github.com/NexusXian/linuxCppTemplate.git
cd linuxCppTemplate

# Configure (uses CMakePresets.json with the vcpkg toolchain)
cmake --preset default

# Compile the project
cmake --build --preset default

# The generated executable is located in the bin/ directory

```


### Or you can simply run the following command to build and run the project

```bash
#build the project
./scripts/build.sh

#run the project
./scripts/run.sh

#build and run the project
./scripts/launch.sh
```

