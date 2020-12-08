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
                    icon: Icon(
                      Mdi.homeOutline,
                      key: Key('home_outline_icon'),
                    ),
                    selectedIcon: Icon(
                      Mdi.home,
                      key: Key('home_icon'),
                    ),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Mdi.briefcaseOutline,
                      key: Key('briefcase_outline_icon'),
                    ),
                    selectedIcon: Icon(
                      Mdi.briefcase,
                      key: Key('briefcase_icon'),
                    ),
                    label: Text('Experience'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Mdi.schoolOutline,
                      key: Key('school_outline_icon'),
                    ),
                    selectedIcon: Icon(
                      Mdi.school,
                      key: Key('school_icon'),
                    ),
                    label: Text('Education'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Mdi.heartOutline,
                      key: Key('heart_outline_icon'),
                    ),
                    selectedIcon: Icon(
                      Mdi.heart,
                      key: Key('heart_icon'),
                    ),
                    label: Text('Volunteering'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Mdi.trophyOutline,
                      key: Key('trophy_outline_icon'),
                    ),
                    selectedIcon: Icon(
                      Mdi.trophy,
                      key: Key('trophy_icon'),
                    ),
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
                icon: Icon(
                  Mdi.homeOutline,
                  key: Key('home_outline_icon'),
                ),
                label: 'Home',
                activeIcon: Icon(
                  Mdi.home,
                  key: Key('home_icon'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Mdi.briefcaseOutline,
                  key: Key('briefcase_outline_icon'),
                ),
                label: 'Experience',
                activeIcon: Icon(
                  Mdi.briefcase,
                  key: Key('briefcase_icon'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Mdi.schoolOutline,
                  key: Key('school_outline_icon'),
                ),
                label: 'Education',
                activeIcon: Icon(
                  Mdi.school,
                  key: Key('school_icon'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Mdi.heartOutline,
                  key: Key('heart_outline_icon'),
                ),
                label: 'Volunteering',
                activeIcon: Icon(
                  Mdi.heart,
                  key: Key('heart_icon'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Mdi.trophyOutline,
                  key: Key('trophy_outline_icon'),
                ),
                label: 'Achievements',
                activeIcon: Icon(
                  Mdi.trophy,
                  key: Key('trophy_icon'),
                ),
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
