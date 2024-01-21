import 'package:path/path.dart' as ph;
import 'package:test/test.dart';
import 'package:wfile/wfile.dart';

void main() {
  test('listToPath', () {
    expect(
      ['shine', 'path', 'to', 'file.txt'].listToPath,
      ph.separator == '/'
          ? 'shine/path/to/file.txt'
          : 'shine\\path\\to\\file.txt',
    );
  });

  test('listToNPath', () {
    expect(
      ['shine', 'path', 'to', 'file.txt'].listToNPath,
      'shine/path/to/file.txt',
    );
  });
}
