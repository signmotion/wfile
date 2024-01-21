import 'package:wfile/wfile.dart';
import 'package:test/test.dart';

void main() {
  test('npath', () {
    expect('shine\\path\\to/file.txt'.npath, 'shine/path/to/file.txt');
  });

  test('pathToList', () {
    expect(
      'shine\\path\\to/file.txt'.pathToList,
      ['shine', 'path', 'to', 'file.txt'],
    );
  });

  test('pathHead', () {
    expect('shine\\path\\to/file.txt'.pathHead, 'shine');
    expect('\\path\\to'.pathHead, '');
    expect('file.txt'.pathHead, 'file.txt');
    expect(''.pathHead, '');
  });

  test('pathAfterHead', () {
    expect('shine\\path\\to/file.txt'.pathAfterHead, 'path/to/file.txt');
    expect('\\path\\to'.pathAfterHead, 'path/to');
    expect('path\\to'.pathAfterHead, 'to');
    expect('file.txt'.pathAfterHead, '');
    expect(''.pathAfterHead, '');
  });

  test('pathTail', () {
    expect('shine\\path\\to/file.txt'.pathTail, 'file.txt');
    expect('shine\\path\\to'.pathTail, 'to');
    expect('shine'.pathTail, 'shine');
    expect(''.pathTail, '');
  });

  test('pathBeforeTail', () {
    expect('shine\\path\\to/file.txt'.pathBeforeTail, 'shine/path/to');
    expect('shine\\path\\to/'.pathBeforeTail, 'shine/path/to');
    expect('shine\\path'.pathBeforeTail, 'shine');
    expect('shine'.pathBeforeTail, '');
    expect('file.txt'.pathBeforeTail, '');
    expect(''.pathBeforeTail, '');
  });

  test('pathWithoutTail', () {
    const s = 'shine\\path\\to/file.txt';
    const ns = 'shine/path/to/file.txt';
    expect(s.pathWithoutTail('to/file.txt'), 'shine/path');
    expect(s.pathWithoutTail('to\\file.txt'), 'shine/path');
    expect(s.pathWithoutTail('path/to\\file.txt'), 'shine');
    expect(s.pathWithoutTail('to1\\file.txt'), ns);
    expect(s.pathWithoutTail(''), ns);

    expect('file.txt'.pathWithoutTail('file.txt'), '');
    expect('file.txt'.pathWithoutTail('txt'), 'file.txt');
    expect('file.txt'.pathWithoutTail(''), 'file.txt');
    expect(''.pathWithoutTail(''), '');
    expect(''.pathWithoutTail('non/existent/tail'), '');
  });
}
