part of '../../../wfile.dart';

class ImageFilesystemBroker extends FilesystemBroker<Image> {
  /// See [readAsImage()] notes for [numChannels] and [alpha].
  ImageFilesystemBroker(
    super.path, {
    this.numChannels,
    this.alpha,
    super.createPathIfNotExists = false,
    super.exceptionWhenFileNotExists = false,
  });

  final int? numChannels;
  final num? alpha;

  @override
  Image? read(String key) =>
      wfile.readAsImage(key, numChannels: numChannels, alpha: alpha);

  @override
  void write(String key, Image value) => wfile.writeAsImage(value, key);
}
