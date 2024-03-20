# WFile

![Cover - WFile](https://raw.githubusercontent.com/signmotion/wfile/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/badge/doc-wfile-blue)](https://pub.dartlang.org/packages/wfile)
[![Build Status](https://github.com/signmotion/wfile/actions/workflows/dart-ci.yml/badge.svg)](https://github.com/signmotion/wfile/actions/workflows/dart-ci.yml)
[![Publisher](https://img.shields.io/pub/publisher/wfile)](https://pub.dev/publishers/syrokomskyi.com)

The package for convenient work with files and their contents across multiple platforms.
Independent of the various system delimiters.
Well-tested Dart package.
Feel free to use it in your awesome projects.

## Usage

### Read Files

```dart
const sourcePath = 'path/prefix';
// const sourcePath = ['path', 'prefix'];
final f = WFile(sourcePath);

// get a varios content from files with respect to [sourcePath]
content = f.readAsText('text.txt');
content = f.readAsBytes('bytes.bin');
content = f.readAsImage('images/1/happy.png');       // path/prefix/images/1/happy.png
content = f.readAsImage(['images', 1, 'happy.png']); // path/prefix/images/1/happy.png
content = f.readAsJsonMap('map.json');               // <- { ... }
content = f.readAsJsonList('list.json');             // <- [ ... ]
content = f.readAsXml('data.xml');                   // <- <data attr="...">...</data>
```

### Write Files

```dart
const sourcePath = 'path/prefix';
// const sourcePath = ['path', 'prefix'];
final f = WFile(sourcePath);

// get a varios content from files with respect to [sourcePath]
f.writeAsText(content, 'text.txt');
f.writeAsBytes(content, 'bytes.bin');
f.writeAsImage(content, 'images/1/happy.png');       // path/prefix/images/1/happy.png
f.writeAsImage([content, 'images', 1, 'happy.png']); // path/prefix/images/1/happy.png
f.writeAsJsonMap(content, 'map.json');               // { ... }
f.writeAsJsonList(content, 'list.json');             // [ ... ]
f.writeAsXml(content, 'data.xml');                   // <data attr="...">...</data>
```

## Welcome

Requests and suggestions are warmly welcome.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/wfile). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/wfile).

## TODO

- All feautures for this package into README.
- Examples with filesystem brokers.
- An example with creating own broker.
