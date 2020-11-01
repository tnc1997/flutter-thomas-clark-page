import 'package:flutter/widgets.dart';
import 'package:thomas_clark/route_paths/main_route_path.dart';
import 'package:thomas_clark/route_paths/route_path.dart';

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
  RoutePath _path;
  Object? _state;

  RouterStateData({
    RoutePath path = const MainRoutePath(),
  }) : _path = path;

  RoutePath get path => _path;

  set path(RoutePath value) {
    if (value != _path) {
      _path = value;
      notifyListeners();
    }
  }

  Object? get state => _state;

  set state(Object? value) {
    if (value != _state) {
      _state = value;
      notifyListeners();
    }
  }
}
