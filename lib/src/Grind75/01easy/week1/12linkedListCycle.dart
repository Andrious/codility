import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

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
