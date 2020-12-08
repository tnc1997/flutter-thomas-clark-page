import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:thomas_clark/router_delegates/main_router_delegate.dart';
import 'package:thomas_clark/states/router_state.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Widget? body;
        Widget? bottomNavigationBar;

        body = Router(
          routerDelegate: MainRouterDelegate(
            routerStateData: RouterState.of(context)!,
          ),
          backButtonDispatcher: Router.of(context)
              .backButtonDispatcher
              ?.createChildBackButtonDispatcher()
                ?..takePriority(),
        );

        if (constraints.maxWidth >= 768) {
          body = Row(
            children: [
              NavigationRail(
                extended: constraints.maxWidth >= 1024,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Mdi.homeOutline),
                    selectedIcon: Icon(Mdi.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Mdi.briefcaseOutline),
                    selectedIcon: Icon(Mdi.briefcase),
                    label: Text('Experience'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Mdi.schoolOutline),
                    selectedIcon: Icon(Mdi.school),
                    label: Text('Education'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Mdi.heartOutline),
                    selectedIcon: Icon(Mdi.heart),
                    label: Text('Volunteering'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Mdi.trophyOutline),
                    selectedIcon: Icon(Mdi.trophy),
                    label: Text('Achievements'),
                  ),
                ],
                selectedIndex: RouterState.of(context)!.selectedIndex,
                onDestinationSelected: (value) {
                  RouterState.of(context)!.selectedIndex = value;
                },
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 1000,
                    ),
                    child: body,
                  ),
                ),
              ),
            ],
          );
        } else {
          bottomNavigationBar = BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Mdi.homeOutline),
                label: 'Home',
                activeIcon: Icon(Mdi.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Mdi.briefcaseOutline),
                label: 'Experience',
                activeIcon: Icon(Mdi.briefcase),
              ),
              BottomNavigationBarItem(
                icon: Icon(Mdi.schoolOutline),
                label: 'Education',
                activeIcon: Icon(Mdi.school),
              ),
              BottomNavigationBarItem(
                icon: Icon(Mdi.heartOutline),
                label: 'Volunteering',
                activeIcon: Icon(Mdi.heart),
              ),
              BottomNavigationBarItem(
                icon: Icon(Mdi.trophyOutline),
                label: 'Achievements',
                activeIcon: Icon(Mdi.trophy),
              ),
            ],
            onTap: (value) {
              RouterState.of(context)!.selectedIndex = value;
            },
            currentIndex: RouterState.of(context)!.selectedIndex,
            type: BottomNavigationBarType.fixed,
          );
        }

        return Scaffold(
          body: SafeArea(
            child: body,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Mdi.email),
            tooltip: 'Email',
            onPressed: () async {
              if (await canLaunch('mailto:tnc1997@virginmedia.com')) {
                await launch('mailto:tnc1997@virginmedia.com');
              }
            },
          ),
          bottomNavigationBar: bottomNavigationBar,
        );
      },
    );
  }
}
