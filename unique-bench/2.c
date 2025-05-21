#define N 1024
int A[N], B[N], haystack[N], needles[N];

// __attribute__((noinline)) int f(int x) { return x * 2; }
// __attribute__((noinline)) int g(int x) { return x * 3; }
// __attribute__((noinline)) int *vec_f(int x1, int x2, int x3, int x4) {
//   int res[4];
//   res[0] = x1 * 2;
//   res[1] = x2 * 2;
//   res[2] = x3 * 2;
//   res[3] = x4 * 2;
//   return res;
// }

__attribute__((noinline)) int ext(int k, int arr[]) {
  for (int i = 0; i < N; i++)
    if (arr[i] == k) {
      return 2 * i;
    } else {
      arr[i] += 1;
    }
  return arr[k];
}

int func() {
  for (int i = 0; i < N; i++) {
    if (A[i] > 0)
      B[i] = ext(i, haystack);
  }
}