part of '../../wfile.dart';

/// Defined separator for path.
const npathSeparator = '/';

/// System separator for path.
final spathSeparator = ph.separator;

extension PathStringExt on String {
  /// Normalized path.
  /// System depends separators replaced to [npathSeparator].
  String get npath => replaceAll('\\', npathSeparator);

  List<String> get pathToList => npath.split(npathSeparator);

  /// A first part of path before first [npathSeparator].
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

  /// A part after last [npathSeparator].
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
  /// Use the [spathSeparator].
  String get listToPath => ph.joinAll(this);

  /// Use the [npathSeparator].
  String get listToNPath => listToPath.npath;
}
