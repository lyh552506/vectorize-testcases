#define N 64
#define M 128

int aa[M][N];
int bb[M][N];
int cc[M][N];

int func(int n) {
  for (int j = 0; j < N; ++j) {
    for (int i = 0; i < M; ++i) {
      aa[i][j] = bb[i][j] + cc[i][j];
    }
  }
}
