import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5];
    // treeNode = createTree(root, 0);
    var result = firstBadVersion(0);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// You are a product manager and currently leading a team to
/// develop a new product. Unfortunately, the latest version of
/// your product fails the quality check.
/// Since each version is developed based on the previous version,
/// all the versions after a bad version are also bad.
///
/// Suppose you have n versions [1, 2, ..., n] and you want to find
/// out the first bad one, which causes all the following ones to be bad.
///
/// You are given an API bool isBadVersion(version) which returns whether
/// version is bad. Implement a function to find the first
/// bad version. You should minimize the number of calls to the API.

/// It's just another binary search with
/// if (nums[mid] == target) replaced with if (isBadVersion(mid))
int firstBadVersion(int n) {
  // Note, we're not dealing with arrays starting at 0
  int start = 1, end = n;
  while (start < end) {
    int mid = start + (end - start) ~/ 2;
    // It's bad, but is it the 'first' bad?
    if (isBadVersion(mid)) {
      // Go towards the start to find the 'first' bad version.
      end = mid;
    } else {
      // Go towards the end to find the 'first' bad version.
      start = mid + 1;
    }
  }
  return start;
}
