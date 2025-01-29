import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution("{[()()]}");
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(String S) {
  // Genius! Pairs have the same index in String.
  const opening = "({[", closing = ")}]";
  final List<int> stack = [];
  int p;
  for (var i = 0; i < S.length; i++) {
    final c = S[i];
    // Open brackets
    if ((p = opening.indexOf(c)) != -1) {
      stack.add(p);
    } else {
      // p is -1
      // Closing brackets;
      if (stack.isEmpty || stack.removeLast() != closing.indexOf(c)) {
        return 0;
      }
    }
  }
  return stack.isEmpty ? 1 : 0;
}
