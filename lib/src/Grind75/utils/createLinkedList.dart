///
ListNode? createLinkedList(List<int> nodes, [int cycleIndex = -1]) {
  //
  ListNode? node;

  if (nodes.isEmpty) return null;

  node = ListNode(nodes[0]);

  ListNode prevNode = node;

  int length = nodes.length;

  List<ListNode> listNodes = [];

  for (int index = 1; index < length; index++) {
    //
    final nextNode = ListNode(nodes[index]);

    prevNode.next = nextNode;

    listNodes.add(prevNode);

    prevNode = nextNode;
  }

  if (cycleIndex > 0 && cycleIndex < length) {
    prevNode.next = listNodes[cycleIndex];
  }

  return node;
}

// Definition for singly-linked list.
class ListNode {
  ListNode([this.val = -1, this.next]);
  int val;
  ListNode? next;
}

///
List<int> linked2List(ListNode? head) {
  List<int> list = [];
  while (head != null) {
    list.add(head.val);
    head = head.next;
  }
  return list;
}
