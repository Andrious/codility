import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list1 = ListNode(1, ListNode(2, ListNode(4)));
    var list2 = ListNode(1, ListNode(3, ListNode(4)));
    list1 = ListNode();
    list2 = ListNode();
    list1 = ListNode();
    list2 = ListNode(0);
    var result = mergeTwoLists(list1, list2);

    /// [1,1,2,3,4,4]
    return const Text('Yaaaa!');
  }
}

class ListNode {
  ListNode([this.val, this.next]);
  int? val;
  ListNode? next;
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  if (list1 == null || list1.val == null) return list2;
  if (list2 == null || list2.val == null) return list1;

  if (list1.val! < list2.val!) {
    list1.next = mergeTwoLists(list1.next, list2);
    return list1;
  } else {
    // List is reversed. listt1.val is greater than list2.val
    list2.next = mergeTwoLists(list1, list2.next);
    return list2;
  }
}
