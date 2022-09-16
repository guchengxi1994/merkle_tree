import 'dart:convert';

import 'package:merkle_tree/merkle_tree.dart';
import 'package:merkle_tree/src/leaf.dart';
import 'package:sm_crypto/sm_crypto.dart';

void main() {
  final s = SM3.encryptString("1请问");
  final s1 = SM3.encryptString("qqq");
  final s2 = SM3.encryptString("3edf");
  final s3 = SM3.encryptString("2fsg");
  // print(s);
  // print(s1);
  final middleS1 = SM3.encryptString(s + s1);
  final middleS2 = SM3.encryptString(s2 + s3);

  final top = SM3.encryptString(middleS1 + middleS2);
  print(top);

  print("===================================================================");

  MerkleTree tree = MerkleTree(leafs: [
    Leaf(data: utf8.encode("1请问")),
    Leaf(data: utf8.encode("qqq")),
    Leaf(data: utf8.encode("3edf")),
    Leaf(data: utf8.encode("2fsg"))
  ]);

  print(tree.hash);

  // print("=====================================================");
  // print(middleS1);

  // print(tree.root.children[0].hash);
}
