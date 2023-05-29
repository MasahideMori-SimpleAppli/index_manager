import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:index_manager/index_manager.dart';

void main() {
  group('serialize test', () {
    test('toDict and fromDict test', () {
      // normal test
      final IndexManager im = IndexManager();
      im.getIndex("first", initialValue: null, isAlwaysInitialize: true);
      im.getIndex("second", initialValue: 2, isAlwaysInitialize: true);
      im.setIndex("third", 3);
      expect(im.getIndex("first") == null, true);
      expect(im.getIndex("second") == 2, true);
      Map<String, dynamic> m = im.toDict(nonSaveKeys: ["second"]);
      im.fromDict(m);
      expect((m["index_map"] as Map).containsKey("first"), true);
      expect(!(m["index_map"] as Map).containsKey("second"), true);
      expect((m["index_map"] as Map)["first"] == null, true);

      // jsonEncode and jsonDecode
      String t = jsonEncode(im.toDict());
      final IndexManager imDecoded = IndexManager();
      imDecoded.fromDict(jsonDecode(t));
      Map<String, int?> decoded = imDecoded.getAllIndex();
      expect(decoded["first"] == null, true);
      expect(decoded["third"] == 3, true);
    });
  });
}
