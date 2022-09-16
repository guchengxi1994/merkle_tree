import 'package:merkle_tree/src/leaf.dart';

class CompareResult {
  bool equals;

  /// 存在不可比较的情况，比如叶子节点数不一致
  ///
  /// 或者不是一个类
  bool canCompare;
  List<List<Leaf>> diffs;

  /// 比较结果
  String message;

  CompareResult(
      {required this.diffs,
      required this.equals,
      required this.canCompare,
      this.message = ""});

  @override
  String toString() {
    String diffDetails = "";

    for (int i = 0; i < diffs.first.length; i++) {
      diffDetails +=
          "${diffs.first[i].toString()}    |${diffs.last[i].toString()}";
    }
    String result = """
    =============================================
    Tree1                 |Tree2
    $diffDetails
    """;

    return result;
  }
}
