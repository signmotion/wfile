// ignore_for_file: avoid_print

import 'package:wfile/wfile.dart';

void main() {
  final f = WFile('example/data');
  print(f.readAsText('happy.txt'));
}
