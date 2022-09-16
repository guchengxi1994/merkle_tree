import 'package:merkle_tree/src/base_node.dart';
import 'package:merkle_tree/src/leaf.dart';
import 'package:merkle_tree/src/root.dart';

class MerkleTree<T extends BaseNode> {
  late Root root;

  List<Leaf> leafs;
  MerkleTree({required this.leafs}) : assert(leafs.isNotEmpty) {
    // 奇数情况下在数组尾部复制一个元素
    if (leafs.length % 2 == 1) {
      leafs.add(leafs.last);
    }

    root = _buildTree(leafs as List<T>).first as Root;
  }

  List<T> _buildTree(List<T> nodes) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<BaseNode> _nodes = [];
    for (int i = 0; i < nodes.length; i = i + 2) {
      int leftIndex = i;
      int rightIndex = i + 1;
      // 奇数情况下在数组尾部复制一个元素
      if (rightIndex == nodes.length) {
        rightIndex = i;
      }

      Root r = Root(children: [nodes[leftIndex], nodes[rightIndex]]);
      _nodes.add(r);
    }
    if (_nodes.length == 1) {
      return _nodes as List<T>;
    }
    return _buildTree(_nodes as List<T>);
  }

  String get hash => root.hash;

  @override
  bool operator ==(Object other) {
    if (other is! MerkleTree) {
      return false;
    }
    return other.hash == hash;
  }

  @override
  int get hashCode => hash.hashCode;
}
