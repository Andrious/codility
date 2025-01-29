import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution('CAGCCTA', [2, 5, 0], [4, 5, 6]);
    final data = jsonEncode(result);
    return Text(data);
  }
}

List<int> solution(String S, List<int> P, List<int> Q) {
  List<int> result = List.filled(P.length, 0);

  final counter = List.generate(4, (_) => List.filled(S.length + 1, 0));

  for (var i = 0; i < S.length; i++) {
    int impact = impactAt(S, i);
    counter[impact - 1][i + 1] = counter[impact - 1][i] + 1;
    for (int j = 0; j < 4; j++) {
      if (j + 1 != impact) counter[j][i + 1] = counter[j][i];
    }
  }
  for (int i = 0; i < P.length; i++) {
    for (int j = 0; j < 4; j++) {
      if (counter[j][Q[i] + 1] > counter[j][P[i]]) {
        result[i] = j + 1;
        break;
      }
    }
  }
  return result;
}

int impactAt(String S, int index) {
  switch (S[index]) {
    case 'A':
      return 1;
    case 'C':
      return 2;
    case 'G':
      return 3;
    case 'T':
      return 4;
  }
  return 0;
}
