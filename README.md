# WFile

![SDK version](https://badgen.net/pub/sdk-version/wfile?style=for-the-badge)
![Supported platforms](https://badgen.net/pub/flutter-platform/wfile?style=for-the-badge)
![Supported SDKs](https://badgen.net/pub/dart-platform/wfile?style=for-the-badge)

![Cover - WFile](https://raw.githubusercontent.com/signmotion/wfile/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/pub/v/wfile.svg?logo=dart&logoColor=00b9fc&color=blue&style=for-the-badge)](https://pub.dartlang.org/packages/wfile)
[![Code Size](https://img.shields.io/github/languages/code-size/signmotion/wfile?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/wfile)
[![Publisher](https://img.shields.io/pub/publisher/wfile?style=for-the-badge)](https://pub.dev/publishers/syrokomskyi.com)

[![Build Status](https://img.shields.io/github/actions/workflow/status/signmotion/wfile/dart-ci.yml?logo=github-actions&logoColor=white&style=for-the-badge)](https://github.com/signmotion/wfile/actions)
[![Pull Requests](https://img.shields.io/github/issues-pr/signmotion/wfile?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/wfile/pulls)
[![Issues](https://img.shields.io/github/issues/signmotion/wfile?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/wfile/issues)
[![Pub Score](https://img.shields.io/pub/points/wfile?logo=dart&logoColor=00b9fc&style=for-the-badge)](https://pub.dev/packages/wfile/score)

The [well-tested](https://github.com/signmotion/wfile/tree/master/test) package for reading and writing JSON, image, text, binary, and XML files across multiple platforms.
Can detect [MIME](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types) types.
Independent of the various system delimiters.
Feel free to use it in your awesome project.

[![CodeFactor](https://codefactor.io/repository/github/signmotion/wfile/badge?style=for-the-badge)](https://codefactor.io/repository/github/signmotion/wfile)

Share some ❤️ and star repo to support the [WFile](https://github.com/signmotion/wfile).

_If you write an article about **WFile** or any of [these](https://pub.dev/packages?q=publisher%3Asyrokomskyi.com&sort=updated) packages, let me know and I'll post the URL of the article in the **README**_ 🤝

## 🔥 Motivation

1. We need to keep the file paths consistent in live cross-platform projects. I mean the dividers for Linux and Windows. I used to use [path](https://pub.dev/packages/path) extensively (thanks to the [authors](https://pub.dev/publishers/dart.dev/packages)), but we got some boilerplate with it.

2. **WFile** contains some abstractions, for ex. `Broker`, and its implementation: `text`, `image`, `xml` for `filesystem`. It helps to share data.

3. Many JSON files are very simple. I often use repetitive code to read them. You can now replace Dart's idioms with this line: `f.readAsJsonMap()` or `f.readAsJsonList()`.

4. Also when reading the image file, we can get the alpha channel guarantee if it is needed.

Additionally with **WFile** you can write just

```dart
f.writeAsImage(image, 'path/to.webp');
```

instead of

```dart
final encoder = findEncoderForNamedImage(p);
if (encoder == null) {
  throw Exception('Not found an encoder for file `$p`.');
}
final bytes = encoder.encode(image);
File(p).writeAsBytesSync(bytes);
```

Thanks [s00prtr00pr](https://reddit.com/user/s00prtr00pr).

## 🚀 Usage

### Read Files

```dart
const sourcePath = 'path/prefix';
// const sourcePath = ['path', 'prefix'];
final f = WFile(sourcePath);

// get a varios content from files with respect to [sourcePath]
f.readAsText('text.txt');
f.readAsTextLines('lines.txt');            // <String>[...]
f.readAsBytes('bytes.bin');
f.readAsImage('images/1/happy.png');       // path/prefix/images/1/happy.png
f.readAsImage(['images', 1, 'happy.png']); // path/prefix/images/1/happy.png
f.readAsJsonMap('map.json');               // <- { ... }
f.readAsJsonList('list.json');             // <- [ ... ]
f.readAsXml('data.xml');                   // <- <data attr="...">...</data>
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

### Copy Files

```dart
f.copy('path/source.file', 'path/destination.file');
```

You can use a relative path.

### Identify a File Type

```dart
final f = WFile('image.webp');

f.application(); // false
f.audio();       // false
f.binary();      // true
f.font();        // false
f.image();       // true
f.text();        // false
f.video();       // false
```

### Identify the MIME type

```dart
f.mime();  // image/webp
```

## ✨ What's New

Look at [changelog](https://pub.dev/packages/wfile/changelog).

## 👋 Welcome

If you encounter any problems, feel free to [open an issue](https://github.com/signmotion/wfile/issues). If you feel the package is missing a feature, please [raise a ticket](https://github.com/signmotion/wfile/issues) on Github and I'll look into it. Requests and suggestions are warmly welcome. Danke!

Contributions are what make the open-source community such a great place to learn, create, take a new skills, and be inspired.

If this is your first contribution, I'll leave you with some of the best links I've found: they will help you get started or/and become even more efficient.

- [Guide to Making a First Contribution](https://github.com/firstcontributions/first-contributions). You will find the guide in your native language.
- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute). Longread for deep diving for first-timers and for veterans.
- [Summer Guide from Google](https://youtu.be/qGTQ7dEZXZc).
- [CodeTriangle](https://codetriage.com). Free community tools for contributing to Open Source projects.

The package **WFile** is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/wfile). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/wfile).

And here is a curated list of how you can help:

- Documenting the undocumented. Whenever you come across a class, property, or method within our codebase that you're familiar with and notice it lacks documentation, kindly spare a couple of minutes to jot down some helpful notes for your fellow developers.
- Refining the code. While I'm aware it's primarily my responsibility to refactor the code, I wholeheartedly welcome any contributions you're willing to make in this area. Your insights and improvements are appreciated!
- Constructive code reviews. Should you discover a more efficient approach to achieve something, I'm all ears. Your suggestions for enhancement are invaluable.
- Sharing your examples. If you've experimented with our use cases or have crafted some examples of your own, feel free to add them to the `example` directory. Your practical insights can enrich our resource pool.
- Fix typos/grammar mistakes.
- Report bugs and scenarios that are difficult to implement.
- Implement new features by making a pull-request.

## ✅ TODO (perhaps)

Once you start using the **WFile**, it will become easy to choose the functionality to contribute. But if you already get everything you need from this package but have some free time, let me write here what I have planned:

- Copy folders.
- All feautures for this package into README.
- Support Web platform.
- Examples with filesystem brokers.
- An example with creating own broker.

It's just a habit of mine: writing down ideas that come to mind while working on a project. I confess that I rarely return to these notes. But now, hopefully, even if you don't have an idea yet, the above notes will help you choose the suitable "feature" and become a contributor to the open-source community.

Ready [for 🪙](https://webduet.de "The Modern Planet-Scale Site for Your Ambitions")

Created [with ❤️](https://syrokomskyi.com "Andrii Syrokomskyi")

[![fresher](https://img.shields.io/badge/maintained%20using-fresher-darkgreen.svg?style=for-the-badge)](https://github.com/signmotion/fresher "Keeps Projects Up to Date")
