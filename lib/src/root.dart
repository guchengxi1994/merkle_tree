import 'package:merkle_tree/src/base_node.dart';
import 'package:sm_crypto/sm_crypto.dart';

class Root<T extends BaseNode> extends BaseNode {
  List<T> children;
  Root({required this.children}) : assert(children.isNotEmpty) {
    hash = _encript();
  }

  String _encript() {
    String encodingStr = "";
    for (final i in children) {
      encodingStr += i.hash;
    }
    return SM3.encryptString(encodingStr);
  }
}
