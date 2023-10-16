import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = [1, 2, 3, 4, 5];
    list.reversed;
    final head = createLinkedList(list);
    var result = reverseList(head);
    var data = jsonEncode(linked2List(result));
    data = '${jsonEncode(list)}\n$data';
    return Text(data);
  }
}

///  list = [1, 2, 3, 4, 5];
///  reversed = [5, 4, 3, 2, 1]
ListNode? reverseList(ListNode? head) {
  final reversed = ListNode();
  while (head != null) {
    // Each previously new node is replaced with the next new Node
    // but, it's not lost---it's assigned as the 'next' Node to this new Node.
    // Not ideal...that memory segment is assigned a value twice in a row.
    reversed.next = ListNode(head.val, reversed.next);
    head = head.next;
  }
  // The start is 'empty', it's next is the beginning
  return reversed.next;
}
