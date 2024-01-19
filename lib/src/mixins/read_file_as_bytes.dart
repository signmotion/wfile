part of '../../wfile.dart';

mixin ReadFileAsBytes on CanWorkWithFile {
  Uint8List? _bytes;

  Uint8List? get bytes => _bytes ??= readAsBytes();

  set bytes(Uint8List? v) => _bytes = v;
}
