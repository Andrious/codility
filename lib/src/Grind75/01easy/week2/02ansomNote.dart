import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ransomNote = "aa", magazine = "aab";
    var result = canConstruct(ransomNote, magazine);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// Given two strings ransomNote and magazine, return true
/// if ransomNote can be constructed by using the letters from
/// magazine and false otherwise.
///
/// Each letter in magazine can only be used once in ransomNote.

// If characters of one string are all found in another string

bool canConstruct(String ransomNote, String magazine) {
  // String into an array of characters
  var ransom = ransomNote.split('');
  var source = magazine.split('');
  for (var i = 0; i < ransom.length; i++) {
    // The instant a 'ransom' letter is not found in the source, exit with false.
    // Removes the first occurrence of [value] (only used once) from this list.
    if (!source.remove(ransom[i])) {
      return false;
    }
  }
  return true;
}
