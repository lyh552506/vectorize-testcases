void fun(int n, int *a, int *b, int *c) {
  for (int i = 0; i < n; ++i) {
    if (b[i])
      a[i] = c[i];
    else
      c[i + 1] = a[i];
  }

}