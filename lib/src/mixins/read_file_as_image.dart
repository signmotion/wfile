part of '../../wfile.dart';

mixin ReadFileAsImage on CanWorkWithFile {
  late final int? numChannels;
  late final num? alpha;

  Image? _image;

  Image? get image =>
      _image ??= readAsImage(numChannels: numChannels, alpha: alpha);

  set image(Image? v) => _image = v;
}
