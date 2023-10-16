import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var strs = ["flower", "flow", "flowers"];
//    strs = ["flight", "flower", "flow", "applesauce", "apple"];
    strs = ["dog", "racecar", "car"];
//    strs = ["flower", "flow", "flight"];
    var result = longestCommonPrefix(strs);
    final data = jsonEncode(result);
    return Text(data);
  }
}

String longestCommonPrefix(List<String> strs) {
  if (strs.length == 1) {
    return strs[0];
  }

  // Descending order should readily reveal the 'longest common prefix'
  strs.sort((a, b) => b.compareTo(a));

  String commonPrefix = '';
  String prefix = strs.first;
  //
  for (final word in strs) {
    // Process those without the current prefix.
    if (!word.startsWith(prefix)) {
      // Whittle down to the shortest prefix if any.
      while (!word.startsWith(prefix)) {
        prefix = prefix.substring(0, prefix.length - 1);
      }

      if (prefix.isEmpty) {
        // New words to check
        prefix = word;
        // If this new prefix is longer, record it.
      } else if (commonPrefix.length > prefix.length) {
        commonPrefix = prefix;
      } else if (commonPrefix.isEmpty) {
        commonPrefix = prefix;
      } else {
        // Return to the original prefix.
        prefix = commonPrefix;
      }
    }
  }
  return commonPrefix;
}
