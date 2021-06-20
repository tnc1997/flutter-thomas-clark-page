import 'package:flutter/material.dart';
import 'package:thomas_clark/route_information_parsers/app_route_information_parser.dart';
import 'package:thomas_clark/router_delegates/app_router_delegate.dart';
import 'package:thomas_clark/states/router_state.dart';
import 'package:thomas_clark/states/theme_state.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _routeInformationParser = AppRouteInformationParser();
  final _routerStateData = RouterStateData();
  final _themeStateData = ThemeStateData();

  late AppRouterDelegate _routerDelegate;

  @override
  Widget build(BuildContext context) {
    return RouterState(
      notifier: _routerStateData,
      child: ThemeState(
        notifier: _themeStateData,
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              routeInformationParser: _routeInformationParser,
              routerDelegate: _routerDelegate,
              title: 'Thomas Clark',
              theme: ThemeData.from(
                colorScheme: ColorScheme.light(
                  primary: Colors.red,
                  primaryVariant: Colors.red[700]!,
                  secondary: Colors.red,
                  secondaryVariant: Colors.red[700]!,
                  surface: Colors.white,
                  background: Colors.grey[50]!,
                  onPrimary: Colors.black,
                  onSecondary: Colors.black,
                  onSurface: Colors.black,
                  onBackground: Colors.black,
                ),
              ),
              darkTheme: ThemeData.from(
                colorScheme: ColorScheme.dark(
                  primary: Colors.red,
                  primaryVariant: Colors.red[700]!,
                  secondary: Colors.red,
                  secondaryVariant: Colors.red[700]!,
                  surface: Colors.grey[850]!,
                  background: Colors.grey[900]!,
                  onPrimary: Colors.black,
                  onSecondary: Colors.black,
                  onSurface: Colors.white,
                  onBackground: Colors.white,
                ),
              ),
              themeMode: ThemeState.of(context)?.themeMode,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _routerDelegate.dispose();
    _routerStateData.dispose();
    _themeStateData.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _routerDelegate = AppRouterDelegate(
      routerStateData: _routerStateData,
    );
  }
}
