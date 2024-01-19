part of '../../wfile.dart';

extension PathStringExt on String {
  static const pathSeparator = '/';

  /// Normalized path.
  /// System depends separators replaced to [pathSeparator].
  String get npath => replaceAll('\\', pathSeparator);
}
