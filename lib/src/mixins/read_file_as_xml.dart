part of '../../wfile.dart';

mixin ReadFileAsXml on CanWorkWithFile {
  XmlDocument? _xml;

  XmlDocument? get xml {
    if (_xml == null) {
      final s = readAsText();
      if (s != null) {
        _xml = XmlDocument.parse(s);
      }
    }

    return _xml;
  }

  set xml(XmlDocument? v) => _xml = v;
}
