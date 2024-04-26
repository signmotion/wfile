import 'dart:io' show Directory, File, PathNotFoundException;

import 'package:wfile/wfile.dart';
import 'package:test/test.dart';

void main() {
  group('exists path, Linux separators', () {
    final f = WFile('test/data');
    test('_', () {
      expect(f.existsDir(), isTrue);
      expect(f.existsFile(), isFalse);
      expect(f.existsAny(), isTrue);
    });

    test('a', () {
      expect(f.existsDir('a'), isTrue);
      expect(f.existsFile('a'), isFalse);
      expect(f.existsAny('a'), isTrue);
    });

    test('a/image.webp', () {
      expect(f.existsDir('a/image.webp'), isFalse);
      expect(f.existsDir(['a', 'image.webp']), isFalse);
      expect(f.existsFile('a/image.webp'), isTrue);
      expect(f.existsFile(['a', 'image.webp']), isTrue);
      expect(f.existsAny('a/image.webp'), isTrue);
      expect(f.existsAny(['a', 'image.webp']), isTrue);
    });
  });

  group('exists path, Windows separators', () {
    final f = WFile(r'test\data');

    test('_', () {
      expect(f.existsDir(), isTrue);
      expect(f.existsFile(), isFalse);
      expect(f.existsAny(), isTrue);
    });

    test('a', () {
      expect(f.existsDir('a'), isTrue);
      expect(f.existsFile('a'), isFalse);
      expect(f.existsAny('a'), isTrue);
    });

    test(r'a\image.webp', () {
      expect(f.existsDir(r'a\image.webp'), isFalse);
      expect(f.existsFile(r'a\image.webp'), isTrue);
      expect(f.existsAny(r'a\image.webp'), isTrue);
    });
  });

  group('exists path, mixed separators', () {
    final f = WFile('test/data');

    test('_', () {
      expect(f.existsDir(), isTrue);
      expect(f.existsFile(), isFalse);
      expect(f.existsAny(), isTrue);
    });

    test(r'a\image.webp', () {
      expect(f.existsDir(r'a\image.webp'), isFalse);
      expect(f.existsFile(r'a\image.webp'), isTrue);
      expect(f.existsAny(r'a\image.webp'), isTrue);
    });
  });

  group('exists path, constructing a path from list', () {
    final f = WFile(['test', 'data']);

    test('_', () {
      expect(f.existsDir(), isTrue);
      expect(f.existsFile(), isFalse);
      expect(f.existsAny(), isTrue);
    });

    test('a', () {
      expect(f.existsDir('a'), isTrue);
      expect(f.existsFile('a'), isFalse);
      expect(f.existsAny('a'), isTrue);
    });

    test('a/image.webp', () {
      expect(f.existsDir(['a/image.webp']), isFalse);
      expect(f.existsFile(['a/image.webp']), isTrue);
      expect(f.existsAny(['a/image.webp']), isTrue);
    });

    test('[]', () {
      expect(f.existsAny(['a', 'image.webp']), isTrue);
    });
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

  test('exists path, constructing a path from [Directory]s and [File]', () {
    const path = 'test/data/a/image.webp';
    final f = WFile([
      Directory('test/data'),
      Directory('a'),
      File('image.webp'),
    ]);

    expect(f.npath, path);
  });

  // test(
  //     'exists path, constructing a path from [Directory]s, [File] and [Directory]',
  //     () {
  //   final ematch = throwsA(const TypeMatcher<ArgumentError>());
  //   expect(
  //       () => WFile([
  //             Directory('test/data'),
  //             Directory('a'),
  //             File('image.webp'),
  //             Directory('some_dir'),
  //           ]),
  //       ematch);
  // });

  test('checking a normalized path, mixed separators', () {
    const path = r'test/data\a\underwater.webp';
    final f = WFile(path);

    expect(f.path, isNot(equals(path)), reason: 'Should be system dependent.');
    expect(f.npath, 'test/data/a/underwater.webp');
    expect(f.npath, path.npath);
  });

  group('null then file not exists', () {
    final f = WFile('undefined/path');

    test('readAsBytes', () {
      expect(f.readAsBytes('a/data.bin'), isNull);
      expect(f.readAsBytes(['a', 'data.bin']), isNull);
    });

    test('readAsJsonMap', () {
      expect(f.readAsJsonMap('a/map.json'), isNull);
      expect(f.readAsJsonMap(['a', 'map.json']), isNull);
    });

    test('readAsJsonMapString', () {
      expect(f.readAsJsonMapString('a/map.json'), isNull);
      expect(f.readAsJsonMapString(['a', 'map.json']), isNull);
    });

    test('readAsJsonList', () {
      expect(f.readAsJsonList('a/list.json'), isNull);
      expect(f.readAsJsonList(['a', 'list.json']), isNull);
    });

    test('readAsJsonListString', () {
      expect(f.readAsJsonListString('a/list.json'), isNull);
      expect(f.readAsJsonListString(['a', 'list.json']), isNull);
    });

    test('readAsImage', () {
      expect(f.readAsImage('a/image.webp'), isNull);
      expect(f.readAsImage(['a', 'image.webp']), isNull);
    });

    test('readAsText', () {
      expect(f.readAsText('a/file.txt'), isNull);
      expect(f.readAsText(['a', 'file.txt']), isNull);
    });

    test('readAsTextLines', () {
      expect(f.readAsTextLines('a/file.txt'), isNull);
      expect(f.readAsTextLines(['a', 'file.txt']), isNull);
    });

    test('readAsXml', () {
      expect(f.readAsXml('a/file.xml'), isNull);
      expect(f.readAsXml(['a', 'file.xml']), isNull);
    });
  });

  group('exception then file not exists', () {
    final f = WFile('undefined/path', exceptionWhenFileNotExists: true);
    final ematch = throwsA(const TypeMatcher<PathNotFoundException>());

    test('readAsBytes', () {
      expect(() => f.readAsBytes('data.bin'), ematch);
    });

    test('readAsJsonMap', () {
      expect(() => f.readAsJsonMap('map.json'), ematch);
    });

    test('readAsJsonMapString', () {
      expect(() => f.readAsJsonMapString('map.json'), ematch);
    });

    test('readAsJsonList', () {
      expect(() => f.readAsJsonList('list.json'), ematch);
    });

    test('readAsJsonListString', () {
      expect(() => f.readAsJsonListString('list.json'), ematch);
    });

    test('readAsImage', () {
      expect(() => f.readAsImage('image.webp'), ematch);
    });

    test('readAsText', () {
      expect(() => f.readAsText('file.txt'), ematch);
    });

    test('readAsTextLines', () {
      expect(() => f.readAsTextLines('file.txt'), ematch);
    });

    test('readAsXml', () {
      expect(() => f.readAsXml('file.xml'), ematch);
    });
  });

  group('copy file', () {
    final f = WFile('test/data/a');

    test('new folder, same name, not exists', () {
      final r = f.copy('README.md', '../../_output/copy/README.md');
      expect(r.existsFile(), isTrue);
      f.delete('../../_output/copy');
    });

    test('same folder, new name, not exists', () {
      final r = f.copy('README.md', 'Copy of README.md');
      expect(r.existsFile(), isTrue);
      r.delete();
    });

    test('new folder, same name, exists', () {
      var r = f.copy('README.md', '../../_output/copy/README.md');
      r = f.copy('README.md', '../../_output/copy/README.md');
      expect(r.existsFile(), isTrue);
      f.delete('../../_output/copy');
    });

    test('same folder, new name, exists', () {
      var r = f.copy('README.md', 'Copy of README.md');
      r = f.copy('README.md', 'Copy of README.md');
      expect(r.existsFile(), isTrue);
      r.delete();
    });
  });

  /* TODO(sign)
  group('copy folder', () {
    final f = WFile('test/data');

    test('new folder, same name, not exists', () {
      final r = f.copy('a', '../../_output/copy/a');
      expect(r.existsDir(), isTrue);
      f.delete('../../_output/copy');
    });

    test('same folder, new name, not exists', () {
      final r = f.copy('a', 'Copy of a');
      expect(r.existsDir(), isTrue);
      r.delete();
    });

    test('new folder, same name, exists', () {
      var r = f.copy('a', '../../_output/copy/a');
      r = f.copy('a', '../../_output/copy/a');
      expect(r.existsDir(), isTrue);
      f.delete('../../_output/copy');
    });

    test('same folder, new name, exists', () {
      var r = f.copy('a', 'Copy of a');
      r = f.copy('a', 'Copy of a');
      expect(r.existsDir(), isTrue);
      r.delete();
    });
  }, tags: ['current']);
  */

  group('mime', () {
    final f = WFile('test/data');

    test('image/jpeg', () {
      expect(f.mime('a/image.jpg'), 'image/jpeg');
    });

    test('image/png', () {
      expect(f.mime('a/image.png'), 'image/png');
    });

    test('image/webp', () {
      expect(f.mime('a/image.webp'), 'image/webp');
    });

    test('', () {
      expect(f.mime('a/image'), '');
    });

    test('text', () {
      expect(f.mime('a/LICENSE'), 'text');
    });

    test('text/markdown', () {
      expect(f.mime('a/README.md'), 'text/markdown');
    });

    test('text/plain', () {
      expect(f.mime('happy.txt'), 'text/plain');
    });
  });

  group('type file detection', () {
    test('image.jpg', () {
      final f = WFile('test/data/a/image.jpg');
      expect(f.application(), isFalse);
      expect(f.audio(), isFalse);
      expect(f.binary(), isTrue);
      expect(f.font(), isFalse);
      expect(f.image(), isTrue);
      expect(f.text(), isFalse);
      expect(f.video(), isFalse);
    });

    test('image without extension', () {
      final f = WFile('test/data/a/image');
      expect(f.application(), isFalse);
      expect(f.audio(), isFalse);
      expect(f.binary(), isTrue);
      expect(f.font(), isFalse);
      expect(f.image(), isFalse);
      expect(f.text(), isFalse);
      expect(f.video(), isFalse);
    });

    test('text markdown', () {
      final f = WFile('test/data/a/README.md');
      expect(f.application(), isFalse);
      expect(f.audio(), isFalse);
      expect(f.binary(), isFalse);
      expect(f.font(), isFalse);
      expect(f.image(), isFalse);
      expect(f.text(), isTrue);
      expect(f.video(), isFalse);
    });

    test('text plain', () {
      final f = WFile('test/data/happy.txt');
      expect(f.application(), isFalse);
      expect(f.audio(), isFalse);
      expect(f.binary(), isFalse);
      expect(f.font(), isFalse);
      expect(f.image(), isFalse);
      expect(f.text(), isTrue);
      expect(f.video(), isFalse);
    });
  });
}
