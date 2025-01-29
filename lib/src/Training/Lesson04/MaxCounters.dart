import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution(5, [3, 4, 4, 6, 1, 4, 4]);
    // result =  [3, 2, 2, 4, 2]
    final data = jsonEncode(result);
    return Text(data);
  }
}

List<int> solution(int N, List<int> A) {
  //
  final counters = List.filled(N, 0);
  var max = 0;
  var maxCounter = 0;

  for (int i = 0; i < A.length; i++) {
    //Increase X by 1 (before update to "maxCounter")
    if (A[i] <= N) {
      var index = A[i] - 1;
      counters[index] = math.max(counters[index], maxCounter);
      counters[index] = counters[index] + 1;
      max = math.max(counters[index], max);

      //Update "maxCounter" with the maximum Value
    } else {
      maxCounter = max;
    }
  }

  //Update the Values to "maxCounter" that haven't been increased
  for (final i = 0; i < counters.length; i++) {
    counters[i] = math.max(counters[i], maxCounter);
  }

  return counters;
}
