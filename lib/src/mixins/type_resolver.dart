part of '../../wfile.dart';

mixin TypeResolver on CanWorkWithFile {
  /// A MIME type of the file or empty string if not detected.
  /// See <https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types>.
  @override
  String mime([dynamic pathToFile]) => lookupMimeType(join(pathToFile)) ?? '';
}
