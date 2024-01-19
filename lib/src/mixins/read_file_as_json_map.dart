part of '../../wfile.dart';

mixin ReadFileAsJsonMap on CanWorkWithFile {
  JsonMap? _jsonMap;

  JsonMap? get jsonMap => _jsonMap ??= readAsJsonMap();

  set jsonMap(JsonMap? v) => _jsonMap = v;
}

mixin ReadFileAsJsonMapT<T> on CanWorkWithFile {
  Map<String, T>? _jsonMapT;

  Map<String, T>? get jsonMapT => _jsonMapT ??= readAsJsonMapT<T>();

  set jsonMapT(Map<String, T>? v) => _jsonMapT = v;
}
