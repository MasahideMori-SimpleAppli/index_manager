import 'package:flutter/material.dart';
import 'package:index_manager/index_manager.dart';

void main() {
  final IndexManager im = IndexManager();
  im.setIndex("first", 1);
  Map<String, dynamic> m = im.toDict();
  final IndexManager imRestored = IndexManager();
  imRestored.fromDict(m);
  debugPrint(imRestored.getAllIndex().toString());
}
