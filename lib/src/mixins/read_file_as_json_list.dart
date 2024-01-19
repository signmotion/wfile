part of '../../wfile.dart';

mixin ReadFileAsJsonList on CanWorkWithFile {
  JsonList? _jsonList;

  JsonList? get jsonList => _jsonList ??= readAsJsonList();

  set jsonList(JsonList? v) => _jsonList = v;
}

mixin ReadFileAsJsonListT<T> on CanWorkWithFile {
  List<T>? _jsonListT;

  List<T>? get jsonListT => _jsonListT ??= readAsJsonListT<T>();

  set jsonListT(List<T>? v) => _jsonListT = v;
}
