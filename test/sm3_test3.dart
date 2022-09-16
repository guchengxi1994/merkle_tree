import 'dart:convert';

import 'package:merkle_tree/src/leaf.dart';
import 'package:sm_crypto/sm_crypto.dart';

void main() {
  final s = SM3.encryptString("1请问");
  print(s);
  Leaf leaf = Leaf(data: utf8.encode("1请问"));
  print(leaf.hash);
  print(leaf);
}
