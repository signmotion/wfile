part of '../../wfile.dart';

mixin ReadFileAsText on CanWorkWithFile {
  String? _text;
  List<String>? _textLines;

  String? get text => _text ??= readAsText();

  set text(String? v) => _text = v;

  List<String>? get textLines => _textLines ??= readAsTextLines();

  set textLines(Iterable<String>? v) => _textLines = v?.toList();
}
