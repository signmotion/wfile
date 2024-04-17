library;

import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:json_dart/json_dart.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as ph;
import 'package:xml/xml.dart';

part 'src/brokers/filesystem/filesystem.dart';
part 'src/brokers/filesystem/image.dart';
part 'src/brokers/filesystem/text.dart';
part 'src/brokers/filesystem/xml.dart';
part 'src/brokers/broker.dart';

part 'src/extensions/path.dart';

part 'src/mixins/can_work_with_file.dart';
part 'src/mixins/read_file_as_bytes.dart';
part 'src/mixins/read_file_as_image.dart';
part 'src/mixins/read_file_as_json_list.dart';
part 'src/mixins/read_file_as_json_map.dart';
part 'src/mixins/read_file_as_text.dart';
part 'src/mixins/read_file_as_xml.dart';
part 'src/mixins/type_resolver.dart';

part 'src/wfile.dart';
