import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = "()";
    s = "()[]{}";
    s = "([])";
    s = "(]";
    var result = isValid(s);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool isValid(String s) {
  String round = "()";
  String curly = "{}";
  String square = "[]";
  while (s.isNotEmpty) {
    if (s.contains(round)) {
      s = s.replaceAll(round, '');
    } else if (s.contains(curly)) {
      s = s.replaceAll(curly, '');
    } else if (s.contains(square)) {
      s = s.replaceAll(square, '');
    } else {
      return false;
    }
  }
  return true;
}
