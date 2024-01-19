# WFile

The package for convenient work with files and their contents across multiple platforms.
Independent of the various system delimiters.

![Cover - WFile](https://raw.githubusercontent.com/signmotion/wfile/master/images/cover.webp)

## Examples

```dart
const sourcePath = 'path/prefix';
final f = WFile(sourcePath);

// get a varios content from files with respect to [sourcePath]
content = f.readAsBytes('bytes.bin');
content = f.readAsText('text.txt');
content = f.readAsImage('images/happy.png'); // -> path/prefix/images/happy.png
content = f.readAsJsonMap('map.json');       // -> { ... }
content = f.readAsJsonList('list.json');     // -> [ ... ]

// in same way we can use [writeAs*] methods
```

## License

[MIT](LICENSE)

## TODO

- All feautures for this package into README.
