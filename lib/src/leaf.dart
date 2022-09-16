import 'dart:convert';

import 'package:merkle_tree/src/base_node.dart';
import 'package:sm_crypto/sm_crypto.dart';

class Leaf extends BaseNode {
  /// 读取的二进制数组
  List<int> data;
  Leaf({required this.data}) {
    hash = _encript();
  }

  String _encript() {
    return SM3.encryptBytes(data);
  }

  @override
  String toString() {
    return utf8.decode(data);
  }
}
