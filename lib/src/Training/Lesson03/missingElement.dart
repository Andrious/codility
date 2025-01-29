import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

/// https://stackoverflow.com/questions/29861306/what-is-the-right-way-to-solve-codilitys-permmissingelem-test-java/54717605#54717605
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution([2, 3, 1, 5]);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// sum of consecutive integers from 1 to n is equal to n(n+1)~/2.
// /// The difference will yield the value of the missing element.
int solution(List<int> A) {
  final n = A.length + 1;
  final result = n * (n + 1) ~/ 2;
  var sum = 0;
  for (var e in A) {
    sum += e;
  }
  return result - sum;
}

// int solution(List<int> A) {
//   int xor = 0, i = 0;
//   A.add(0); // in case there isn't one.
//   for (i = 0; i < A.length; i++) {
//     xor = xor ^ i ^ A[i];
//   }
//   return xor ^ i;
// }
