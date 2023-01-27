#include <algorithm>

int foo(int *b, int *e, int a) {
    if (std::find_if(b, e, [=](int i) { return i == a; }) != e)
      return a;
    return 0;

}
