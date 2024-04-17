// ignore_for_file: avoid_print

import 'package:wfile/wfile.dart';

void main() {
  final f = WFile('example/data');

  // read a content
  print(f.readAsText('happy.txt'));

  // identiry a type
  print(f.binary('image.webp'));

  // identiry the MIME type
  print(f.mime('image.webp'));
}
