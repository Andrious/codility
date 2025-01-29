import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/implement-queue-using-stacks/
///
/// Implement a first in first out (FIFO) queue using only two stacks.
/// The implemented queue should support all the functions of
/// a normal queue (push, peek, pop, and empty).
///
/// Implement the MyQueue class:
///
/// void push(int x) Pushes element x to the back of the queue.
/// int pop() Removes the element from the front of the queue and
/// returns it.
/// int peek() Returns the element at the front of the queue.
/// boolean empty() Returns true if the queue is empty, false otherwise.
/// Notes:
///
/// You must use only standard operations of a stack,
/// which means only push to top,
/// peek/pop from top, size, and is empty operations are valid.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your MyQueue object will be instantiated and called as such:
    MyQueue myQueue = MyQueue();
    myQueue.push(1); // queue is: [1]
    myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
    myQueue.peek(); // return 1
    myQueue.pop(); // return 1, queue is [2]
    var result = myQueue.empty(); // return false
    final data = jsonEncode(result);
    return Text(data);
  }
}

class MyQueue {
  MyQueue();
  //
  final List<int> _input = [];

  void push(int x) => _input.add(x);

  int pop() => _input.removeAt(0);
  // removeLast(); There's no removeFirst();
  // removeWhere(bool test(E element));
  // remove(value); // first occurrence
  // retainWhere(bool test(E element));
  // void insert(int index, E element); // Inserts [element] at position [index] in this list.
  // void insertAll(int index, Iterable<E> iterable); // Inserts all objects of [iterable] at position [index] in this list.
  // void setAll(int index, Iterable<E> iterable); // Overwrites elements with the objects of [iterable].
  // E removeAt(int index); // Removes the object at position [index] from this list.

  // Iterable<E> getRange(int start, int end);
  // removeRange(int start, int end);  // ≤ `start` and < `end` Reduces length by `end - start`.
  // void fillRange(int start, int end, [E? fillValue]); Overwrites a range of elements with [fillValue].
  // void replaceRange(int start, int end, Iterable<E> replacements); Replaces a range of elements with the elements of [replacements].

  int peek() => _input.first;

  bool empty() => _input.isEmpty;
}

/// final list1 = <int>[1, 2, 3, 4];
/// final list2 = <int>[5, 6, 7, 8, 9];
/// // Copies the 4th and 5th items in list2 as the 2nd and 3rd items
/// // of list1.
/// const skipCount = 3;
// list1.setRange(1, 3, list2, skipCount);
/// print(list1); // [1, 8, 9, 4]
