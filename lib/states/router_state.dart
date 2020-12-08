import 'package:flutter/widgets.dart';

class RouterState extends InheritedNotifier<RouterStateData> {
  const RouterState({
    Key? key,
    RouterStateData? notifier,
    required Widget child,
  }) : super(
          key: key,
          notifier: notifier,
          child: child,
        );

  static RouterStateData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RouterState>()?.notifier;
  }
}

class RouterStateData extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    if (value != _selectedIndex) {
      _selectedIndex = value;
      notifyListeners();
    }
  }
}
