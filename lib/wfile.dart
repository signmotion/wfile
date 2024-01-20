library;

import 'dart:io';
import 'dart:convert' as convert;
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:path/path.dart' as ph;
import 'package:xml/xml.dart';

part 'src/extensions/json.dart';
part 'src/extensions/path.dart';

part 'src/mixins/can_work_with_file.dart';
part 'src/mixins/read_file_as_bytes.dart';
part 'src/mixins/read_file_as_image.dart';
part 'src/mixins/read_file_as_json_list.dart';
part 'src/mixins/read_file_as_json_map.dart';
part 'src/mixins/read_file_as_text.dart';
part 'src/mixins/read_file_as_xml.dart';

part 'src/types.dart';
part 'src/wfile.dart';
