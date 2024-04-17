part of '../../wfile.dart';

mixin TypeFileResolver on CanWorkWithFile {
  /// Detects application.
  bool application([dynamic pathToFile]) =>
      mime(pathToFile).startsWith('application');

  /// Detects audio.
  bool audio([dynamic pathToFile]) => mime(pathToFile).startsWith('audio');

  /// Detects binary.
  /// Everything that isn't [text].
  bool binary([dynamic pathToFile]) => !text(pathToFile);

  /// Detects font.
  bool font([dynamic pathToFile]) => mime(pathToFile).startsWith('font');

  /// Detects image.
  bool image([dynamic pathToFile]) => mime(pathToFile).startsWith('image');

  /// Detects text.
  bool text([dynamic pathToFile]) => mime(pathToFile).startsWith('text');

  /// Detects video.
  bool video([dynamic pathToFile]) => mime(pathToFile).startsWith('video');

  /// A MIME type of the file or empty string if not detected.
  /// See <https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types>.
  String mime([dynamic pathToFile]) => lookupMimeType(join(pathToFile)) ?? '';
}
