import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/contains-duplicate/
///
/// Given an integer array nums, return true if any value appears
/// at least twice in the array, and return false if every element is distinct.
///
/// Example 1:
///
/// Input: nums = [1,2,3,1]
/// Output: true
/// Example 2:
///
/// Input: nums = [1,2,3,4]
/// Output: false
/// Example 3:
///
/// Input: nums = [1,1,1,3,3,4,3,2,4,2]
/// Output: true
///
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [1, 2, 3, 1];
//    nums = [1, 2, 3, 4];
//    nums = [1, 7, 1, 3, 3, 4, 3, 2, 4, 2];
    var result = containsDuplicate(nums);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool containsDuplicate(List<int> numbers) {
  // toSet() will remove duplicates! They're can be no duplicates!
  if (numbers.toSet().toList().length == numbers.length) {
    return false;
  } else {
    return true;
  }
}

bool containsDuplicate02(List<int> numbers) {
  // array of 'past' integers;
  final List<int> pastInts = [];
  for (final i in numbers) {
    if (pastInts.contains(i)) {
      return true;
    }
    pastInts.add(i);
  }
  return false;
}

/// Iterable:
///
/// followedBy(Iterable<E> other); // Concatenate.
/// toSet();
/// toList({bool growable = true});
/// map<T>(T toElement(E e))
/// where(bool test(E element))
/// whereType<T>() // with all elements that have type [T].
/// expand<T>(Iterable<T> toElements(E element)) // expand each to zero or more elements
/// bool contains(Object? element)
/// void forEach(void action(E element))
/// iteratively combining elements to the one running value
/// reduce(E combine(E value, E element))
/// iteratively combining elements to the one running initialValue
/// fold<T>(T initialValue, T combine(T previousValue, E element))
/// bool every(bool test(E element)) // every element must satisfy test
/// join([String separator = ""]) // to a String.
/// bool any(bool test(E element)) // any satisfies test
/// take(int count) // of the first [count] of the elements
/// takeWhile(bool test(E value)) // of the leading elements satisfying [test].
/// skip(int count) // All but the first [count] of elements
/// skipWhile(bool test(E value)) // skips leading elements while [test] is satisfied.
/// get single // Throws a [StateError] if empty or has more than one element.
/// firstWhere(bool test(E element), {E orElse()?}) // The first element that satisfies [test].
///                                                    or result the [orElse] function
/// lastWhere(bool test(E element), {E orElse()?}) // TThe first element that satisfies [test].
///                            orElse: () => -1)       or result the [orElse] function
/// singleWhere(bool test(E element), {E orElse()?}) // single element that satisfies [test].
/// elementAt(int index)
