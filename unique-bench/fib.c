#include <cstdio>
#include <vector>
int factorial(int n) {
  //   int tmp = n + 3;
  //   for (int i = 0; i < n; i++) {
  //     tmp += i;
  //   }
  if (n <= 2)
    return 1;
  return factorial(n - 1) + factorial(n - 2);
}

std::vector<int> vec_factorial(int n1, int n2, int n3, int n4) {
  if (n1 <= 1 && n2 <= 1 && n3 <= 1 && n4 <= 1) {
    return {1, 1, 1, 1};
  } else if (n2 <= 1 && n3 <= 1 && n4 <= 1) {
    return {factorial(n1 - 1) + factorial(n1 - 2), 1, 1, 1};
  } else if (n3 <= 1 && n4 <= 1) {
    return {factorial(n1 - 1) + factorial(n1 - 2),
            factorial(n2 - 1) + factorial(n2 - 2), 1, 1};
  } else if (n4 <= 1) {
    return {factorial(n1 - 1) + factorial(n1 - 2),
            factorial(n2 - 1) + factorial(n2 - 2),
            factorial(n3 - 1) + factorial(n3 - 2), 1};
  } else {
    return {factorial(n1 - 1) + factorial(n1 - 2),
            factorial(n2 - 1) + factorial(n2 - 2),
            factorial(n3 - 1) + factorial(n3 - 2),
            factorial(n4 - 1) + factorial(n4 - 2)};
  }
}

int main() {
  int result = 0;
  for (int i = 0; i < 8; i++) {
    printf("%d\n", result);
    result += factorial(i);
  }
  result = 0;
  for (int i = 0; i < 8; i += 4) {
    auto x = vec_factorial(i, i + 1, i + 2, i + 3);
    for (auto m : x)
      result += m;
  }
  return result;
}