import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/add-binary/
///
/// Given two binary strings a and b, return their sum as a binary string.
///
/// Example 1:
///
/// Input: a = "11", b = "1"
/// Output: "100"
///
/// Example 2:
///
/// Input: a = "1010", b = "1011"
/// Output: "10101"
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = '11';
    var b = '1'; // 11 + 1 = 100;
    var result = addBinary(a, b);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// Strings
/// string = 'Hello';     /// The character (as a single-code-unit [String]) at the given [index].
/// string[0] = 'H'       //  String operator [](int index);

/// Returns the 16-bit UTF-16 code unit at the given [index].
// int codeUnitAt(int index);
/// Returns the number of UTF-16 code units in this string.
// int get length;
/// A hash code derived from the code units of the string.
// int get hashCode;
/// If one string is a prefix of the other,
/// then the shorter string is ordered before the longer string.
/// Returns a negative value if `this` is ordered before `other`,
/// a positive value if `this` is ordered after `other`,
// int compareTo(String other);
/// Whether this string ends with [other].
// bool endsWith(String other);
/// Whether this string starts with a match of [pattern].
// bool startsWith(Pattern pattern, [int index = 0]);
/// Returns the position of the first match of [pattern] in this string,
/// starting at [start], inclusive:
// int indexOf(Pattern pattern, [int start = 0]);
/// The starting position of the last match [pattern] in this string.
// int lastIndexOf(Pattern pattern, [int? start]);
/// Whether this string is empty.
// bool get isEmpty;
/// Whether this string is not empty.
//bool get isNotEmpty;

String addBinary(String a, String b) {
  // Variable to store the sum of the binary numbers.
  String binarySum = '';

  // Variable to store the carry over.
  int carry = 0;
  // Variables to keep track of binary numbers bits from backwards.
  int i = a.length - 1;
  int j = b.length - 1;

  // Loop till all the bits are evaluated from backwards.
  while (i >= 0 || j >= 0) {
    // Get the value of the current bits from binary numbers.
    int bitA = i >= 0 ? int.parse(a[i]) : 0;
    int bitB = j >= 0 ? int.parse(b[j]) : 0;
    // Add the current bits and the carry to sum.
    int sum = bitA + bitB + carry;
    // For the value of the next bit, find the remainder of the sum and add it
    // at the beginning of `binarySum`.
    // For example the below 3 cases will be possible:
    // Case 1: sum = 1 + 0 = 1, nextBit = 1 % 2 = 1, carry = 1 ~/ 2 = 0
    // Case 2: sum = 1 + 1 = 2, nextBit = 2 % 2 = 0, carry = 2 ~/ 2 = 1
    // Case 3: sum = 1 + 1 + 1 = 3, nextBit = 3 % 2 = 1, carry = 3 ~/ 2 = 1.
    binarySum = (sum % 2).toString() + binarySum;
    // Update the carry for the next iteration.
    carry = sum ~/ 2;
    // Update the variables that keep track of binary numbers bits.
    i--;
    j--;
  }

  // If carry is not 0, add it to the beginning of the `binarySum`.
  if (carry > 0) {
    binarySum = '1$binarySum';
  }

  // Return the sum of the binary numbers.
  return binarySum;
}

String addBinary02(String a, String b) {
  String sum = ""; //result string
  //c=carry, i=last index of string a, j=last index of string b
  int i = a.length - 1, j = b.length - 1, c = 0;
  // i==0 || j==0 means run loop till we cover both strings completely
  // and c>0 states even if we covered both strings but carry still remains
  while (i >= 0 || j >= 0 || c > 0) {
    // carry=carry+ int value of a[i]
    if (i >= 0) c += int.parse(a[i--]);
    // carry=carry + int value of b[j]
    if (j >= 0) c += int.parse(b[j--]);
    //  c%2 means insert 0 if carry==0  or carry==2 (1+1) because
    //  ('1'+'1'=0 in binary) else insert 1 ('0'+'1'=1)
    sum = (c % 2).toString() + sum;
    //if c==2 or 3, there is a carry
    // i.e 1 otherwise no carry (3 in case if prev c=1 and a[i]=1 and b[i]=1)
    c = c ~/ 2;
  }
  return sum;
}
