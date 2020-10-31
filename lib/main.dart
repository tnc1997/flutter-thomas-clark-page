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
      title: 'Thomas Clark',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Colors.red,
          primaryVariant: Colors.red[700],
          secondary: Colors.red,
          secondaryVariant: Colors.red[700],
          surface: Colors.white,
          background: Colors.grey[50],
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.dark(
          primary: Colors.red[200],
          primaryVariant: Colors.red[700],
          secondary: Colors.red[200],
          secondaryVariant: Colors.red[700],
          surface: Colors.grey[850],
          background: Colors.grey[900],
        ),
      ),
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
