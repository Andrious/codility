void missingInteger() {
  final n = solution([1, 3, 6, 4, 1, 2]);
  solution([1, 2, 3]);
  solution([1, 3]);

  print(n);
}

int solution(List<int> A) {
  int N = A.length;
  int i = -1;
  Set<int> set = {};
  for (final a in A) {
    if (a > 0) {
      set.add(a);
    }
  }
  for (int i = 1; i <= N + 1; i++) {
    if (!set.contains(i)) {
      return i;
    }
  }
  return -1;
}
