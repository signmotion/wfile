part of '../../wfile.dart';

mixin CanWorkWithFile on Object {
  late final String _path;

  /// Path with a system separator.
  /// See [spathSeparator].
  String get path => _path;

  set path(dynamic v) {
    assert(v != null);

    _path = _sanitizePath(v);
  }

  /// If `true` returns `null` when a requested file not found.
  bool get exceptionWhenFileNotExists => false;

  static String _sanitizePath(dynamic v) =>
      ph.joinAll(_joinWithoutPrefix(v)?.trim().npath.pathToList ?? []);

  /// Normalized path.
  /// See [PathStringExt.npath].
  String get npath => path.npath;

  void counstructPath({bool? hasFile}) => counstructPathToFile(path);

  static void counstructPathToFile(String pathToFile, {bool? hasFile}) {
    hasFile ??= ph.extension(pathToFile).isNotEmpty;
    final dir = hasFile ? ph.dirname(pathToFile) : pathToFile;
    Directory(dir).createSync(recursive: true);
  }

  String join(dynamic anyPath, [bool withPrefix = true]) => withPrefix
      ? ph.join(path, _joinWithoutPrefix(anyPath))
      : _joinWithoutPrefix(anyPath) ?? '';

  static String? _joinWithoutPrefix(dynamic anyPath) => switch (anyPath) {
        (String s) => s,
        (Iterable<String> l) => ph.joinAll(l),
        (Iterable<dynamic> l) => ph.joinAll(l.map((v) => _anyTypeToString(v))),
        (null) => null,
        (dynamic s) => _anyTypeToString(s),
      };

  /// Exists a file or directory.
  /// [path] can be [String] or [Iterable<String>].
  bool existsAny([dynamic path]) => existsFile(path) || existsDir(path);

  bool existsDir([dynamic pathToDir]) =>
      Directory(join(pathToDir)).existsSync();

  bool existsFile([dynamic pathToFile]) => File(join(pathToFile)).existsSync();

  Uint8List? readAsBytes([dynamic pathToFile]) =>
      readOrDefaults(pathToFile, (file) => file.readAsBytesSync());

  JsonMap? readAsJsonMap([dynamic pathToFile]) =>
      readAsText(pathToFile)?.jsonMap;

  Map<String, String>? readAsJsonMapString([dynamic pathToFile]) =>
      readAsJsonMap(pathToFile)
          ?.map((k, v) => MapEntry(k, _anyTypeToString(v)));

  Map<String, T>? readAsJsonMapT<T>([dynamic pathToFile]) =>
      readAsJsonMap(pathToFile)?.map((k, v) => MapEntry(k, v as T));

  JsonList? readAsJsonList([dynamic pathToFile]) =>
      readAsText(pathToFile)?.jsonList;

  List<String>? readAsJsonListString([dynamic pathToFile]) =>
      readAsJsonList(pathToFile)?.map((v) => _anyTypeToString(v)).toList();

  List<T>? readAsJsonListT<T>([dynamic pathToFile]) =>
      readAsJsonList(pathToFile)?.map((v) => v as T).toList();

  /// Read image and can get a guarantee an alpha channel.
  /// If the [numChannels] is 4 and the current image does not have an alpha
  /// channel, then the given [alpha] value will be used to set the new alpha
  /// channel.
  /// If [alpha] is not provided, then the [maxChannelValue] will be used to
  /// set the alpha.
  Image? readAsImage(dynamic pathToFile, {int? numChannels, num? alpha}) =>
      readOrDefaults(
        pathToFile,
        (file) {
          final bytes = file.readAsBytesSync();
          // use filename extension to determine the decoder
          final image =
              decodeNamedImage(ph.join(path, join(pathToFile)), bytes)!;

          return numChannels == null && alpha == null
              ? image
              : image.convert(numChannels: numChannels, alpha: alpha);
        },
      );

  String? readAsText([dynamic pathToFile]) =>
      readOrDefaults(pathToFile, (file) => file.readAsStringSync());

  XmlDocument? readAsXml([dynamic pathToFile]) => readOrDefaults(
        pathToFile,
        (file) => XmlDocument.parse(file.readAsStringSync()),
      );

  T? readOrDefaults<T>(
    dynamic pathToFile,
    T Function(File) reader, {
    T? defaults,
  }) {
    final file = File(ph.join(path, join(pathToFile)));
    return exceptionWhenFileNotExists || file.existsSync()
        ? reader(file)
        : defaults;
  }

  void writeAsBytes(Uint8List bytes, [dynamic pathToFile]) {
    final pf = ph.join(path, join(pathToFile));
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    File(pf).writeAsBytesSync(bytes);
  }

  void writeAsImage(Image image, [dynamic pathToFile]) {
    final pf = ph.join(path, join(pathToFile));
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    final encoder = findEncoderForNamedImage(pf);
    if (encoder == null) {
      throw Exception('Not found an encoder by extension for file `$pf`.');
    }

    final bytes = encoder.encode(image);
    File(pf).writeAsBytesSync(bytes);
  }

  void writeAsText(String text, [dynamic pathToFile]) {
    final pf = ph.join(path, join(pathToFile));
    if (pathToFile != null) {
      counstructPathToFile(pf);
    }
    File(pf).writeAsStringSync(text);
  }

  void writeAsXml(
    XmlDocument xml, [
    dynamic pathToFile,
    bool pretty = false,
  ]) =>
      writeAsText(xml.toXmlString(pretty: pretty));

  static String _anyTypeToString(dynamic v) => v.toString();
}
