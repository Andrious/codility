import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/linked-list-cycle/
/// Given head, the head of a linked list, determine if the linked list has a cycle in it.
///
/// There is a cycle in a linked list if there is some node
/// in the list that can be reached again by continuously following
/// the next pointer.
/// Internally, pos is used to denote the index of the node that
/// tail's next pointer is connected to.
/// Note that pos is not passed as a parameter.
///
/// Return true if there is a cycle in the linked list. Otherwise, return false.
///
///
///
/// Example 1:
///
///
/// Input: head = [3,2,0,-4], pos = 1
/// Output: true
/// Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
/// Example 2:
///
///
/// Input: head = [1,2], pos = 0
/// Output: true
/// Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
/// Example 3:
///
///
/// Input: head = [1], pos = -1
/// Output: false
/// Explanation: There is no cycle in the linked list.
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final head = [3, 2, 0, -4];
    const pos = 1;
    final linkedLIst = createLinkedList(head, pos);
    var result = hasCycle(linkedLIst!);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool hasCycle(ListNode head) {
  // Use the fast-slow method
  ListNode? slow = head, fast = head;
  while (fast != null && fast.next != null) {
    fast = fast.next?.next;
    slow = slow?.next;
    if (fast != null && fast == slow) {
      return true;
    }
  }
  return false;
}
