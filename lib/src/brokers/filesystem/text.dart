part of '../../../wfile.dart';

class TextFilesystemBroker extends FilesystemBroker<String> {
  TextFilesystemBroker(
    super.path, {
    super.createPathIfNotExists = false,
    super.exceptionWhenFileNotExists = false,
  });

  @override
  String? read(String key) => wfile.readAsText(key);

  @override
  void write(String key, String value) => wfile.writeAsText(value, key);
}
