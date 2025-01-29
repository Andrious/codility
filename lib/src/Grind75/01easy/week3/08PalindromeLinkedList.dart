import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/palindrome-linked-list/
///
/// Given the head of a singly linked list, return true if it is a
/// palindrome or false otherwise.
///
/// Example 1:
///
/// Input: head = [1,2,2,1]
/// Output: true
///
/// Example 2:
///
/// Input: head = [1,2]
/// Output: false
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [1, 2, 2, 1];
    list = [1, 2];
    final head = createLinkedList(list);
    var result = isPalindrome(head);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool isPalindrome(ListNode? head) {
  final values = <int>[];
  while (head != null) {
    values.add(head.val);
    head = head.next;
  }
  return values.join('') == values.reversed.join('');
}

// bool isPalindrome(ListNode? head) {
//   List<int> numbers = [];
//   while (head != null) {
//     numbers.add(head.val);
//     head = head.next;
//   }
//   // Just go half way and compare the starting from the ends.
//   for (int i = 0; i < (numbers.length / 2).floor(); i++) {
//     if (numbers[i] != numbers[numbers.length - 1 - i]) {
//       return false;
//     }
//   }
//   return true;
// }

ListNode? reverseLinkedList(ListNode? head) {
  ListNode? newHead;

  while (head != null) {
    final next = head.next;
    head.next = newHead;
    newHead = head;
    head = next;
  }

  return newHead;
}

ListNode? getMiddleNode(ListNode? head) {
  ListNode? slow = head?.next;
  ListNode? fast = head?.next?.next;

  while (fast != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }

  return slow;
}
