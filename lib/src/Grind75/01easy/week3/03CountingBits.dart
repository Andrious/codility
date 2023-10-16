import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var n = 2;
//    n = 5;
    var result = countBits(n);
    final data = jsonEncode(result);
    return Text(data);
  }
}

// f[i] = f[i / 2] + i % 2
List<int> countBits(int n) {
  final f = List.generate(n + 1, (index) => 0);
  for (int i = 1; i <= n; i++) {
    f[i] = f[i >> 1] + (i % 2);
  }
  return f;
}
