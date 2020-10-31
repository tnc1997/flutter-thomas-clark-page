import 'package:flutter/widgets.dart';

extension MediaQueryDataExtensions on MediaQueryData {
  bool get isLarge => size.width >= 1024;

  bool get isMedium => size.width >= 768 && size.width < 1024;

  bool get isSmall => size.width < 768;
}
