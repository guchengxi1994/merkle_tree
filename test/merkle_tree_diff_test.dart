import 'dart:convert';

import 'package:merkle_tree/merkle_tree.dart';
import 'package:merkle_tree/src/leaf.dart';

void main() {
  MerkleTree tree1 = MerkleTree(leafs: [
    Leaf(data: utf8.encode("1请问")),
    Leaf(data: utf8.encode("qqq")),
    Leaf(data: utf8.encode("3edf")),
    Leaf(data: utf8.encode("2fsg"))
  ]);

  MerkleTree tree2 = MerkleTree(leafs: [
    Leaf(data: utf8.encode("1请问")),
    Leaf(data: utf8.encode("qqq")),
    Leaf(data: utf8.encode("3edf")),
    Leaf(data: utf8.encode("2fsgs"))
  ]);

  print(tree1.diff(tree2));
}
