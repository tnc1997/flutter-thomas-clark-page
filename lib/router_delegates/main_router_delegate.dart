import 'package:flutter/material.dart';
import 'package:thomas_clark/pages/achievements_page.dart';
import 'package:thomas_clark/pages/education_page.dart';
import 'package:thomas_clark/pages/experience_page.dart';
import 'package:thomas_clark/pages/home_page.dart';
import 'package:thomas_clark/pages/volunteering_page.dart';
import 'package:thomas_clark/route_paths/route_path.dart';
import 'package:thomas_clark/states/router_state.dart';

class MainRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  final RouterStateData routerStateData;

  MainRouterDelegate({
    required this.routerStateData,
  }) {
    routerStateData.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (routerStateData.selectedIndex == 0)
          MaterialPage<void>(
            child: HomePage(),
            key: ValueKey('home_page'),
          )
        else if (routerStateData.selectedIndex == 1)
          MaterialPage<void>(
            child: ExperiencePage(),
            key: ValueKey('experience_page'),
          )
        else if (routerStateData.selectedIndex == 2)
          MaterialPage<void>(
            child: EducationPage(),
            key: ValueKey('education_page'),
          )
        else if (routerStateData.selectedIndex == 3)
          MaterialPage<void>(
            child: VolunteeringPage(),
            key: ValueKey('volunteering_page'),
          )
        else if (routerStateData.selectedIndex == 4)
          MaterialPage<void>(
            child: AchievementsPage(),
            key: ValueKey('achievements_page'),
          ),
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  void dispose() {
    routerStateData.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Future<void> setNewRoutePath(RoutePath path) async {}
}
