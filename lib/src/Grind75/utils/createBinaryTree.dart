///
TreeNode? createTree(List<int?> nodes,
    [int index = 0, TreeNode? treeNode, int inc = 0]) {
  //
  if (treeNode != null) {
    if (index >= nodes.length) {
      return null;
    }
    var node = nodes[index];
    if (node != null) {
      treeNode.left = TreeNode(node);
    }
    index++;
    if (index >= nodes.length) {
      return null;
    }
    node = nodes[index];
    if (node != null) {
      treeNode.right = TreeNode(node);
    }
    createTree(nodes, inc + index + 1, treeNode.left, 2);
    createTree(nodes, inc + index + 3, treeNode.right, 4);
  } else {
    if (index == 0) {
      treeNode = createTree(nodes, index + 1, TreeNode(nodes[index]!));
    }
  }
  return treeNode;
}

///
class TreeNode {
  TreeNode([this.val = 0, this.left, this.right]);
  int val;
  TreeNode? left;
  TreeNode? right;
}
