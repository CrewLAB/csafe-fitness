import 'dart:typed_data';

import 'package:csafe_fitness/src/command.dart';
import 'package:test/test.dart';

void main() {
  group('Tests for CsafeDataStructure', () {
    Uint8List csafeDataBytes = Uint8List.fromList([0x02, 0x0, 0xF2]);

    Uint8List csafeLongDataBytes =
        Uint8List.fromList([0x02, 0x0, 0xF2, 0xF3, 0xF4]);

    test('test parse data bytes', () {
      CsafeDataStructure data = CsafeDataStructure.fromBytes(csafeDataBytes);
      expect(data.byteCount, 2);
      expect(data.data, Uint8List.fromList([0x0, 0xF2]));
    });

    test('test parse extraneously long data bytes', () {
      CsafeDataStructure data =
          CsafeDataStructure.fromBytes(csafeLongDataBytes);
      expect(data.byteCount, 2);
      expect(data.data, Uint8List.fromList([0x0, 0xF2]));
    });

    test('test symmetric parsing', () {
      CsafeDataStructure data = CsafeDataStructure.fromBytes(csafeDataBytes);
      expect(data.toBytes(), csafeDataBytes);
    });
  });

  group('Tests for CsafeCommandIdentifier', () {
    test('test detect short command', () {
      CsafeCommandIdentifier ids = CsafeCommandIdentifier(0xA1);

      expect(ids.type, CsafeCommandType.SHORT);
    });

    test('test detect long command', () {
      CsafeCommandIdentifier idl = CsafeCommandIdentifier(0x6D);

      expect(idl.type, CsafeCommandType.LONG);
    });
  });
}