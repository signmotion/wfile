# WFile

![Cover - WFile](https://raw.githubusercontent.com/signmotion/wfile/master/images/cover.webp)

The package for convenient work with files and their contents across multiple platforms.
Independent of the various system delimiters.
Well-tested Dart package.

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

## License

[MIT](LICENSE)

## TODO

- All feautures for this package into README.
- Examples with filesystem brokers.
- An example with creating own broker.
