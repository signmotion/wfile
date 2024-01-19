part of '../../wfile.dart';

mixin ReadFileAsText on CanWorkWithFile {
  String? _text;

  String? get text => _text ??= readAsText();

  set text(String? v) => _text = v;
}
