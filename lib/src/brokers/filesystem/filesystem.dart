part of '../../../wfile.dart';

abstract class FilesystemBroker<T> extends Broker<String, T> {
  FilesystemBroker(
    String path, {
    bool createPathIfNotExists = false,
    bool exceptionWhenFileNotExists = false,
  }) : wfile = WFile(
          path,
          createPathIfNotExists: createPathIfNotExists,
          exceptionWhenFileNotExists: exceptionWhenFileNotExists,
        );

  final WFile wfile;

  @override
  String get prefix => wfile.npath;

  @override
  bool exists(String key) => wfile.existsAny(key);

  @override
  void delete(String key) => wfile.delete(key);

  @override
  void clear() {
    wfile.delete();

    if (wfile.createPathIfNotExists) {
      wfile.counstructPath();
    }
  }
}
