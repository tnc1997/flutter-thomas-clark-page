import 'package:flutter/material.dart';
import 'package:thomas_clark/route_information_parsers/app_route_information_parser.dart';
import 'package:thomas_clark/router_delegates/app_router_delegate.dart';
import 'package:thomas_clark/states/router_state.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _routeInformationParser = AppRouteInformationParser();

  AppRouterDelegate _routerDelegate;
  RouterStateData _notifier;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
      title: 'Flutter Demo',
    );
  }

  @override
  void dispose() {
    _routerDelegate.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _notifier = RouterStateData();
    _routerDelegate = AppRouterDelegate(
      notifier: _notifier,
    );
  }
}
