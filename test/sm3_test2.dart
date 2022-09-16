import 'dart:convert';

import 'package:sm_crypto/sm_crypto.dart';

void main() {
  final s = SM3.encryptString("1请问");
  print(s);
  final s2 = SM3.encryptBytes(utf8.encode("1请问"));
  print(s2);
}
