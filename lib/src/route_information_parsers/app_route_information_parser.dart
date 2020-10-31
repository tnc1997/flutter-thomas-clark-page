import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:thomas_clark/src/configurations/router_configuration.dart';
import 'package:thomas_clark/src/route_paths/main_route_path.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouterConfiguration> {
  @override
  Future<RouterConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location);

    return SynchronousFuture(
      RouterConfiguration(
        path: MainRoutePath(),
        state: routeInformation.state,
      ),
    );
  }

  @override
  RouteInformation restoreRouteInformation(
    RouterConfiguration configuration,
  ) {
    final path = configuration.path;

    if (path is MainRoutePath) {
      return RouteInformation(
        location: '/',
        state: configuration.state,
      );
    }

    return null;
  }
}
