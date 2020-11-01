import 'package:flutter/material.dart';

class ThemeState extends InheritedNotifier<ThemeStateData> {
  const ThemeState({
    Key? key,
    ThemeStateData? notifier,
    required Widget child,
  }) : super(
          key: key,
          notifier: notifier,
          child: child,
        );

  static ThemeStateData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeState>()?.notifier;
  }
}

class ThemeStateData extends ChangeNotifier {
  ThemeMode _themeMode;

  ThemeStateData({
    ThemeMode themeMode = ThemeMode.system,
  }) : _themeMode = themeMode;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    if (value != _themeMode) {
      _themeMode = value;
      notifyListeners();
    }
  }
}
