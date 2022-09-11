#include <string>
#include <fstream>
#include "banner.hpp"

using std::string;
using std::ifstream;
using std::istreambuf_iterator;

const string load_banner() {
  string      resource_path(RESOURCE_DIR);
  ifstream    bannerfile(resource_path + string("/banner.txt"));
  string      banner((istreambuf_iterator<char>(bannerfile)),
                     (istreambuf_iterator<char>()));

  return banner;
}
