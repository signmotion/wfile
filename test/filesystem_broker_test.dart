import 'dart:io';

import 'package:path/path.dart' as ph;
import 'package:test/test.dart';
import 'package:wfile/wfile.dart';

void main() {
  group('FilesystemBroker Text', () {
    final outputPath =
        ph.join('test', '_output', 'filesystem_broker_test', 'text');
    final broker = TextFilesystemBroker(outputPath);

    const key = '1.txt';
    const value = 'Some\nmultiline text\n\t1234567890  ';

    setUp(() {
      broker.clear();
      expect(broker.exists(key), isFalse);
    });

    broker.clear();

    test('Write and read', () {
      // write
      broker.write(key, value);
      expect(File(ph.join(outputPath, key)).existsSync(), isTrue);

      // read
      final r = broker.read(key);
      expect(r, value);
    });

    test('Reading a not exists key', () {
      final r = broker.read('some_not_exists_key');
      expect(r, isNull);
    });
  });
}
