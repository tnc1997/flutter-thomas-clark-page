import 'package:flutter/widgets.dart';

extension MediaQueryDataExtensions on MediaQueryData {
  bool get isLarge => size.shortestSide >= 1024;

  bool get isMedium => size.shortestSide >= 768 && size.shortestSide < 1024;

  bool get isSmall => size.shortestSide < 768;
}
