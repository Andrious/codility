import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
/// The array contains an odd number of elements,
/// except for one element that is left unpaired.
/// Return that unpaired number.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final test = [9, 3, 9, 3, 9, 7, 9];
    var result = solution(test);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(List<int> A) {
  int result = 0;
  for (int num in A) {
    result = result ^ num;
  }
  return result;
}
