#include <fmt/core.h>
#include <iostream>

int main(int argc, char *argv[]) {
  std::cout << "this is a linux cpp project template" << std::endl;
  fmt::print("vcpkg dependency fmt/{} is working\n", FMT_VERSION);
  return 0;
}
