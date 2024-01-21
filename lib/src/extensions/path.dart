part of '../../wfile.dart';

const pathSeparator = '/';

extension PathStringExt on String {
  /// Normalized path.
  /// System depends separators replaced to [pathSeparator].
  String get npath => replaceAll('\\', pathSeparator);

  List<String> get pathToList => npath.split(pathSeparator);

  /// A first part of path before first [pathSeparator].
  /// The string will be normalized before processing.
  String get pathHead {
    final l = npath.pathToList;
    return l.isEmpty ? '' : l.first;
  }

  /// A part without [pathHead].
  /// The string will be normalized before processing.
  /// The result path will be normalized.
  String get pathAfterHead {
    final l = npath.pathToList;
    return l.length < 2 ? '' : l.sublist(1).listToNPath;
  }

  /// A part after last [pathSeparator].
  /// The string will be normalized before processing.
  String get pathTail {
    final l = npath.pathToList;
    return l.isEmpty ? '' : l.last;
  }

  /// A part without [pathTail].
  /// The string will be normalized before processing.
  /// The result path will be normalized.
  String get pathBeforeTail {
    final l = npath.pathToList;
    return l.length < 2 ? '' : l.sublist(0, l.length - 1).listToNPath;
  }

  /// Remove [tail] then [tail] presents.
  /// See also [pathTail], [pathBeforeTail].
  String pathWithoutTail(String tail) {
    final sp = pathToList;
    final tp = tail.pathToList;
    if (sp.isEmpty || tp.isEmpty || sp.length < tp.length) {
      return npath;
    }

    var delta = 1;
    for (; delta <= tp.length; ++delta) {
      if (tp[tp.length - delta] != sp[sp.length - delta]) {
        return npath;
      }
    }

    return delta - 1 == tp.length
        ? sp.sublist(0, sp.length - delta + 1).listToNPath
        : npath;
  }
}

extension PathListStringExt on List<String> {
  /// Use a system separator.
  String get listToPath => ph.joinAll(this);

  /// Use the [pathSeparator].
  String get listToNPath => listToPath.npath;
}
