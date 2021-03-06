import 'dart:typed_data';

import 'package:csafe_fitness/src/helpers.dart';
import 'package:test/test.dart';

void main() {
  group('combineTwoLists - ', () {
    test('can combine two uint8lists', () {
      Uint8List data = Uint8List.fromList([0xDE, 0xAD, 0xBE, 0xEF]);

      Uint8List data2 = Uint8List.fromList([0xEF, 0xBE, 0xAD, 0xDE]);

      expect(combineTwoLists(data, data2),
          Uint8List.fromList([0xDE, 0xAD, 0xBE, 0xEF, 0xEF, 0xBE, 0xAD, 0xDE]));
    });
  });
}
