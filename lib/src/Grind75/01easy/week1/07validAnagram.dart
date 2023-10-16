import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = 'act';
    var t = 'cat';
    s = 'players';
    t = 'parsley';
    var result = isAnagram(s, t);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool isAnagram(String s, String t) {
  // A String to an Array
  var a = s.split('');
  var b = t.split('');
  // In alphabetical order
  a.sort();
  b.sort();
  // An Array to a String
  final w = a.join();
  final e = b.join();
  return w == e;
}
