part of '../wfile.dart';

class WFile with CanWorkWithFile {
  /// [path] Can be [String] or [Iterable<String>].
  WFile(
    dynamic path, {
    bool createPathIfNotExists = false,
    this.exceptionWhenFileNotExists = false,
  }) {
    this.path = join(path, false);

    if (createPathIfNotExists) {
      counstructPath();
    }
  }

  @override
  final bool exceptionWhenFileNotExists;
}
