import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// Given the head of a singly linked list, return the middle node of the linked list.
/// If there are two middle nodes, return the second middle node.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [1, 2, 3, 4, 5];
    var head = createLinkedList(list);
    var result = middleNode(head);
    var data = jsonEncode(linked2List(result));
    list = [1, 2, 3, 4, 5, 6];
    head = createLinkedList(list);
    result = middleNode(head);
    data = '$data\n${jsonEncode(linked2List(result))}';
    return Text(data);
  }
}

///
/// Input: head = [1,2,3,4,5]
/// Output: [3,4,5]
/// Explanation: The middle node of the list is node 3.
/// Input: head = [1,2,3,4,5,6]
/// Output: [4,5,6]
/// Explanation: Since the list has two middle nodes with values 3 and 4,
/// we return the second one. (with its subsequent 'next' nodes)

/// Fast and Slow Pointer finds middle of Linked List
ListNode? middleNode(ListNode? head) {
  ListNode? fast = head;
  ListNode? slow = head;
  // As long as the 'next' in the fast is not null
  while (fast != null && fast.next != null) {
    // Continue going to the current's next next (Two Nodes ahead of current)
    fast = fast.next?.next;
    // You're 'next' is always 'half' the progress of fast.
    slow = slow?.next;
  }

  return slow;
}
