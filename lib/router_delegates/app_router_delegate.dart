import 'package:flutter/material.dart';
import 'package:thomas_clark/configurations/router_configuration.dart';
import 'package:thomas_clark/pages/main_page.dart';
import 'package:thomas_clark/states/router_state.dart';

class AppRouterDelegate extends RouterDelegate<RouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouterConfiguration> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  final RouterStateData notifier;

  AppRouterDelegate({
    required this.notifier,
  }) {
    notifier.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const MaterialPage<void>(
        child: const MainPage(),
        key: const ValueKey('main_page'),
      ),
    ];

    return RouterState(
      notifier: notifier,
      child: Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (route, result) {
          final success = route.didPop(result);

          return success;
        },
      ),
    );
  }

  @override
  RouterConfiguration get currentConfiguration {
    return RouterConfiguration(
      path: notifier.path,
      state: notifier.state,
    );
  }

  @override
  void dispose() {
    notifier.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Future<void> setNewRoutePath(RouterConfiguration configuration) async {
    notifier.path = configuration.path;
    notifier.state = configuration.state;
  }
}
