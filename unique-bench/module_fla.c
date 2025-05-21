#define N 1024
int A[N], B[N];

__attribute__((noinline)) int f(int x) { return x * 2; }

int func() {
  for (int i = 0; i < N; i++) {
    if (A[i] > 0)
      B[i] = f(A[i]);
  }
}