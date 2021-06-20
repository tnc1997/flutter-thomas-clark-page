import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:thomas_clark/route_paths/achievements_route_path.dart';
import 'package:thomas_clark/route_paths/education_route_path.dart';
import 'package:thomas_clark/route_paths/experience_route_path.dart';
import 'package:thomas_clark/route_paths/home_route_path.dart';
import 'package:thomas_clark/route_paths/route_path.dart';
import 'package:thomas_clark/route_paths/volunteering_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location!);

    switch (uri.pathSegments.length) {
      case 1:
        switch (uri.pathSegments[0]) {
          case 'achievements':
            return SynchronousFuture(const AchievementsRoutePath());
          case 'education':
            return SynchronousFuture(const EducationRoutePath());
          case 'experience':
            return SynchronousFuture(const ExperienceRoutePath());
          case 'volunteering':
            return SynchronousFuture(const VolunteeringRoutePath());
        }
        break;
    }

    return SynchronousFuture(HomeRoutePath());
  }

  @override
  RouteInformation? restoreRouteInformation(
    RoutePath configuration,
  ) {
    if (configuration is AchievementsRoutePath) {
      return const RouteInformation(
        location: '/achievements',
      );
    } else if (configuration is EducationRoutePath) {
      return const RouteInformation(
        location: '/education',
      );
    } else if (configuration is ExperienceRoutePath) {
      return const RouteInformation(
        location: '/experience',
      );
    } else if (configuration is HomeRoutePath) {
      return const RouteInformation(
        location: '/',
      );
    } else if (configuration is VolunteeringRoutePath) {
      return const RouteInformation(
        location: '/volunteering',
      );
    }

    return null;
  }
}
