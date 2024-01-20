import 'dart:io' show PathNotFoundException;

import 'package:wfile/wfile.dart';
import 'package:test/test.dart';

void main() {
  test('exists path, Linux separators', () {
    final f = WFile('test/data');

    expect(f.existsAny(), isTrue);
    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);

    expect(f.existsAny('a'), isTrue);
    expect(f.existsDir('a'), isTrue);
    expect(f.existsFile('a'), isFalse);

    expect(f.existsAny('a/underwater.webp'), isTrue);
    expect(f.existsDir('a/underwater.webp'), isFalse);
    expect(f.existsFile('a/underwater.webp'), isTrue);

    expect(f.existsAny(['a', 'underwater.webp']), isTrue);
  });

  test('exists path, Windows separators', () {
    final f = WFile('test\\data');

    expect(f.existsAny(), isTrue);
    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);

    expect(f.existsAny('a'), isTrue);
    expect(f.existsDir('a'), isTrue);
    expect(f.existsFile('a'), isFalse);

    expect(f.existsAny('a\\underwater.webp'), isTrue);
    expect(f.existsDir('a\\underwater.webp'), isFalse);
    expect(f.existsFile('a\\underwater.webp'), isTrue);
  });

  test('exists path, mixed separators', () {
    final f = WFile('test/data');

    expect(f.existsAny(), isTrue);
    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);

    expect(f.existsAny('a\\underwater.webp'), isTrue);
    expect(f.existsDir('a\\underwater.webp'), isFalse);
    expect(f.existsFile('a\\underwater.webp'), isTrue);
  });

  test('checking a normalized path, mixed separators', () {
    const path = 'test/data\\a\\underwater.webp';
    final f = WFile(path);

    expect(f.path, isNot(equals(path)), reason: 'Should be system dependent.');
    expect(f.npath, 'test/data/a/underwater.webp');
    expect(f.npath, path.npath);
  });

  test('constructing a path from list', () {
    final f = WFile(['test', 'data']);

    expect(f.existsAny(), isTrue);
    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);

    expect(f.existsAny('a'), isTrue);
    expect(f.existsDir('a'), isTrue);
    expect(f.existsFile('a'), isFalse);

    expect(f.existsAny(['a/underwater.webp']), isTrue);
    expect(f.existsDir(['a/underwater.webp']), isFalse);
    expect(f.existsFile(['a/underwater.webp']), isTrue);

    expect(f.existsAny(['a', 'underwater.webp']), isTrue);
  });

  test('null then file not exists', () {
    final f = WFile('undefined/path');

    expect(f.readAsBytes('data.bin'), isNull);
    expect(f.readAsJsonMap('map.json'), isNull);
    expect(f.readAsJsonMapString('map.json'), isNull);
    expect(f.readAsJsonList('list.json'), isNull);
    expect(f.readAsJsonListString('list.json'), isNull);
    expect(f.readAsImage('image.webp'), isNull);
    expect(f.readAsText('file.txt'), isNull);
    expect(f.readAsXml('file.xml'), isNull);
  });

  test('exception then file not exists', () {
    final f = WFile('undefined/path', exceptionWhenFileNotExists: true);

    final ematch = throwsA(const TypeMatcher<PathNotFoundException>());
    expect(() => f.readAsBytes('data.bin'), ematch);
    expect(() => f.readAsJsonMap('map.json'), ematch);
    expect(() => f.readAsJsonMapString('map.json'), ematch);
    expect(() => f.readAsJsonList('list.json'), ematch);
    expect(() => f.readAsJsonListString('list.json'), ematch);
    expect(() => f.readAsImage('image.webp'), ematch);
    expect(() => f.readAsText('file.txt'), ematch);
    expect(() => f.readAsXml('file.xml'), ematch);
  });
}
