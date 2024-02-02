part of '../../../wfile.dart';

class XmlFilesystemBroker extends FilesystemBroker<XmlDocument> {
  XmlFilesystemBroker(
    super.path, {
    this.pretty = false,
    this.indent = '  ',
    this.newLine = '/r/n',
    super.createPathIfNotExists = false,
    super.exceptionWhenFileNotExists = false,
  });

  final bool pretty;
  final String indent;
  final String newLine;

  @override
  XmlDocument? read(String key) {
    final s = wfile.readAsText(key);
    return s == null ? null : XmlDocument.parse(s);
  }

  @override
  void write(String key, XmlDocument value) => wfile.writeAsText(
      value.toXmlString(
        pretty: pretty,
        indent: indent,
        newLine: newLine,
      ),
      key);
}
