part of '../wfile.dart';

class WFile with CanWorkWithFile {
  WFile(String path, {bool createPathIfNotExists = false}) {
    this.path = path;

    if (createPathIfNotExists) {
      counstructPath();
    }
  }

  static const pathSeparator = CanWorkWithFile.pathSeparator;
}
