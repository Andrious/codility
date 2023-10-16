import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String s = "ab#c", t = "ad#c";
    // s = "ab##";
    // t = "c#d#";
    // s = "a#c";
    // t = "b";
    var result = backspaceCompare(s, t);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool backspaceCompare(String s, String t) {
  //
  int sPtr = s.length - 1;
  int tPtr = t.length - 1;

  while (sPtr >= 0 || tPtr >= 0) {
    //
    int sSkip = 0; // '#'

    while (sPtr >= 0 && (s[sPtr] == '#' || sSkip > 0)) {
      //
      if (s[sPtr] == '#') {
        sSkip++;
      } else {
        sSkip--;
      }
      sPtr--;
    }

    int tSkip = 0; //

    while (tPtr >= 0 && (t[tPtr] == '#' || tSkip > 0)) {
      //
      if (t[tPtr] == '#') {
        tSkip++;
      } else {
        tSkip--;
      }
      tPtr--;
    }

    //
    if ((sPtr >= 0) != (tPtr >= 0)) {
      return false;
    }
    if (sPtr >= 0 && tPtr >= 0 && s[sPtr] != t[tPtr]) {
      return false;
    }

    sPtr--;
    tPtr--;
  }

  return true;
}
