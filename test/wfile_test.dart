import 'dart:io' show Directory, File, PathNotFoundException;

import 'package:wfile/wfile.dart';
import 'package:test/test.dart';

void main() {
  test('exists path, Linux separators', () {
    final f = WFile('test/data');

    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);
    expect(f.existsAny(), isTrue);

    expect(f.existsDir('a'), isTrue);
    expect(f.existsFile('a'), isFalse);
    expect(f.existsAny('a'), isTrue);

    expect(f.existsDir('a/image.webp'), isFalse);
    expect(f.existsDir(['a', 'image.webp']), isFalse);
    expect(f.existsFile('a/image.webp'), isTrue);
    expect(f.existsFile(['a', 'image.webp']), isTrue);
    expect(f.existsAny('a/image.webp'), isTrue);
    expect(f.existsAny(['a', 'image.webp']), isTrue);

    expect(f.existsAny(['a', 'image.webp']), isTrue);
  });

  test('exists path, Windows separators', () {
    final f = WFile(r'test\data');

    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);
    expect(f.existsAny(), isTrue);

    expect(f.existsDir('a'), isTrue);
    expect(f.existsFile('a'), isFalse);
    expect(f.existsAny('a'), isTrue);

    expect(f.existsDir(r'a\image.webp'), isFalse);
    expect(f.existsFile(r'a\image.webp'), isTrue);
    expect(f.existsAny(r'a\image.webp'), isTrue);
  });

  test('exists path, mixed separators', () {
    final f = WFile('test/data');

    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);
    expect(f.existsAny(), isTrue);

    expect(f.existsDir(r'a\image.webp'), isFalse);
    expect(f.existsFile(r'a\image.webp'), isTrue);
    expect(f.existsAny(r'a\image.webp'), isTrue);
  });

  test('exists path, constructing a path from list', () {
    final f = WFile(['test', 'data']);

    expect(f.existsDir(), isTrue);
    expect(f.existsFile(), isFalse);
    expect(f.existsAny(), isTrue);

    expect(f.existsDir('a'), isTrue);
    expect(f.existsFile('a'), isFalse);
    expect(f.existsAny('a'), isTrue);

    expect(f.existsDir(['a/image.webp']), isFalse);
    expect(f.existsFile(['a/image.webp']), isTrue);
    expect(f.existsAny(['a/image.webp']), isTrue);

    expect(f.existsAny(['a', 'image.webp']), isTrue);
  });

  test('exists path, constructing a path from [File]', () {
    const path = 'test/data/a/image.webp';
    final f = WFile(File(path));

    expect(f.npath, path);
  });

  test('exists path, constructing a path from [Directory]', () {
    const path = 'test/data/a';
    final f = WFile(Directory(path));

    expect(f.npath, path);
  });

  test('checking a normalized path, mixed separators', () {
    const path = r'test/data\a\underwater.webp';
    final f = WFile(path);

    expect(f.path, isNot(equals(path)), reason: 'Should be system dependent.');
    expect(f.npath, 'test/data/a/underwater.webp');
    expect(f.npath, path.npath);
  });

  test('null then file not exists', () {
    final f = WFile('undefined/path');

    expect(f.readAsBytes('a/data.bin'), isNull);
    expect(f.readAsBytes(['a', 'data.bin']), isNull);

    expect(f.readAsJsonMap('a/map.json'), isNull);
    expect(f.readAsJsonMap(['a', 'map.json']), isNull);

    expect(f.readAsJsonMapString('a/map.json'), isNull);
    expect(f.readAsJsonMapString(['a', 'map.json']), isNull);

    expect(f.readAsJsonList('a/list.json'), isNull);
    expect(f.readAsJsonList(['a', 'list.json']), isNull);

    expect(f.readAsJsonListString('a/list.json'), isNull);
    expect(f.readAsJsonListString(['a', 'list.json']), isNull);

    expect(f.readAsImage('a/image.webp'), isNull);
    expect(f.readAsImage(['a', 'image.webp']), isNull);

    expect(f.readAsText('a/file.txt'), isNull);
    expect(f.readAsText(['a', 'file.txt']), isNull);

    expect(f.readAsXml('a/file.xml'), isNull);
    expect(f.readAsXml(['a', 'file.xml']), isNull);
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
