import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
/// https://codereview.stackexchange.com/questions/166347/binarygap-challenge
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution(1041);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(int N) {
  //
  int work = N;

  /// shift the bits to the right by 1 with: num >>= 1;
  while (work > 0 && (work & 1) == 0) {
    work >>= 1;
  }

  /// It's safe to shift one more time, in case the last bit is 1.
  work >>= 1;

  int longest = 0;

  int zeros = 0;

  while (work > 0) {
    /// check if the last bit is 0: if ((num & 1) == 0) {
    if ((work & 1) == 0) {
      zeros++;
    } else {
      longest = max(longest, zeros);
      zeros = 0;
    }
    work >>= 1;
  }
  return longest;
}
