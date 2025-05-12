#define n 128
int haystack[n];
int needles[n];
int needle_idxs[n + 1];

int func() {
  for (int i = 0; i < 128; i++) {
    if (haystack[i] != needles[i]) {
      needle_idxs[i] = i;
      needle_idxs[i + 1] = i + 1;
      needle_idxs[i + 2] = i + 2;
      needle_idxs[i + 3] = i + 3;
      needle_idxs[i + 4] = i + 4;
    }
  }
}