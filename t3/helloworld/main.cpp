#include <iostream>

#include "banner.hpp"

using std::cout;
using std::endl;

int main() {
  auto message = "Hello world!!!";

  cout << load_banner() << endl;
  cout << message << endl;

  return 0;
}
