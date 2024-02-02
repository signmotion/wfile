part of '../wfile.dart';

class WFile with CanWorkWithFile {
  /// [path] Can be [String] or [Iterable<Object>].
  WFile(
    dynamic path, {
    this.createPathIfNotExists = false,
    this.exceptionWhenFileNotExists = false,
  }) {
    this.path = join(path, false);

    if (createPathIfNotExists) {
      counstructPath();
    }
  }

  final bool createPathIfNotExists;

  @override
  final bool exceptionWhenFileNotExists;
}
