import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
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
  int longest = 0;
  int pos = 0;
  int lastPos = -1;
  while (N != 0) {
    pos++;
    if ((N & 1) == 1) {
      if (lastPos != -1) {
        longest = max(longest, pos - lastPos);
      }
      lastPos = pos;
    }
    N >>= 1;
  }
  return longest;
}

// int solution(int N) {
//   int indexOne = -1, longestDistance = 0;
//   for (int i = 0; i < 32; ++i) {
//     // 32 bit number so 32 iterations,
//     // could also use Integer.toBinaryString(N).length() but
//     // the time it takes to convert to binary string is
//     // longer than just doing extra iterations for numbers smaller than 32 bits in size
//     if (((N >> i) & 1) == 1) {
//       final shift = N >> i;
//       final bitAnd = shift & 1;
//       // take the right most bit, use the bitwise 'AND' operator, if result is 1 then bit was a 1
//       if (indexOne != -1) {
//         // only the first 1 will not trigger this conditional
//         longestDistance = max(longestDistance, i - indexOne); // greedy
//       }
//       indexOne = i; // update the index of the most recently seen '1'
//     }
//   }
//
//   return longestDistance;
// }
