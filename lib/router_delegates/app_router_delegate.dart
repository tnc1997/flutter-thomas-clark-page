import 'package:flutter/material.dart';
import 'package:thomas_clark/pages/main_page.dart';
import 'package:thomas_clark/route_paths/achievements_route_path.dart';
import 'package:thomas_clark/route_paths/education_route_path.dart';
import 'package:thomas_clark/route_paths/experience_route_path.dart';
import 'package:thomas_clark/route_paths/home_route_path.dart';
import 'package:thomas_clark/route_paths/route_path.dart';
import 'package:thomas_clark/route_paths/volunteering_route_path.dart';
import 'package:thomas_clark/states/router_state.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  final RouterStateData routerStateData;

  AppRouterDelegate({
    required this.routerStateData,
  }) {
    routerStateData.addListener(notifyListeners);
  }

  @override
  RoutePath? get currentConfiguration {
    switch (routerStateData.selectedIndex) {
      case 0:
        return const HomeRoutePath();
      case 1:
        return const ExperienceRoutePath();
      case 2:
        return const EducationRoutePath();
      case 3:
        return const VolunteeringRoutePath();
      case 4:
        return const AchievementsRoutePath();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage<void>(
          child: MainPage(),
          key: ValueKey('main_page'),
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
  Future<void> setNewRoutePath(RoutePath configuration) async {
    if (configuration is AchievementsRoutePath) {
      routerStateData.selectedIndex = 4;
    } else if (configuration is EducationRoutePath) {
      routerStateData.selectedIndex = 2;
    } else if (configuration is ExperienceRoutePath) {
      routerStateData.selectedIndex = 1;
    } else if (configuration is HomeRoutePath) {
      routerStateData.selectedIndex = 0;
    } else if (configuration is VolunteeringRoutePath) {
      routerStateData.selectedIndex = 3;
    }
  }
}
