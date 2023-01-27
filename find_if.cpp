int* foo(int *__first, int* __last, int (*__pred)(int)) {
    int __trip_count = (__last - __first) >> 2;
    for (; __trip_count > 0; --__trip_count)
    {
      if (__pred(*__first))
        return __first;
      ++__first;
      if (__pred(*__first))
        return __first;
      ++__first;
      if (__pred(*__first))
        return __first;
      ++__first;
      if (__pred(*__first))
        return __first;
      ++__first;
    }
    return __last;
}
