import 'package:flutter/material.dart';
import 'package:thomas_clark/src/configurations/router_configuration.dart';
import 'package:thomas_clark/src/pages/home_page.dart';
import 'package:thomas_clark/src/states/router_state.dart';

class AppRouterDelegate extends RouterDelegate<RouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouterConfiguration> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  final RouterStateData notifier;

  AppRouterDelegate({
    @required this.notifier,
  }) {
    notifier.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    final path = notifier.path;

    final pages = [
      const MaterialPage<void>(
        child: const HomePage(
          title: 'Flutter Demo Home Page',
        ),
        key: const Key('home_page'),
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
