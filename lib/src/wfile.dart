part of '../wfile.dart';

class WFile with CanWorkWithFile {
  /// [path] Can be [String], [File], [Directory] or [Iterable<Object>].
  WFile(
    dynamic path, {
    this.createPathIfNotExists = false,
    this.exceptionWhenFileNotExists = false,
  }) {
    final pp = switch (path) {
      FileSystemEntity r => r.path,
      _ => path,
    };
    this.path = join(pp, false);

    if (createPathIfNotExists) {
      counstructPath();
    }
  }

  final bool createPathIfNotExists;

  @override
  final bool exceptionWhenFileNotExists;
}
