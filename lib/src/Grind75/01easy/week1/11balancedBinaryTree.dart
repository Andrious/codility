import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final root = [3, 9, 20, null, null, 15, 7];
    final treeNode = createTree(root, 0);
    var result = isBalanced(treeNode);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int count(TreeNode? node) {
  if (node == null) return 0;
  int l = count(node.left);
  if (l == -1) return -1;
  int r = count(node.right);
  if (r == -1) return -1;
  // If either side has more than one level return -1
  if ((r - l > 1) || (l - r > 1)) return -1;
  // Remember, it comes out of left or right with a count!
  return (l >= r ? l + 1 : r + 1);
}

bool isBalanced(TreeNode? root) => count(root) != -1;
