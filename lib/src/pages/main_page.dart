import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:thomas_clark/src/extensions/media_query_data_extensions.dart';
import 'package:thomas_clark/src/pages/home_page.dart';
import 'package:thomas_clark/src/pages/skills_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
  }) : super(
          key: key,
        );

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index;

  @override
  Widget build(BuildContext context) {
    final body = IndexedStack(
      index: _index,
      children: [
        const HomePage(),
        const SkillsPage(),
      ],
    );

    return Scaffold(
      body: MediaQuery.of(context).isMedium || MediaQuery.of(context).isLarge
          ? Row(
              children: [
                NavigationRail(
                  extended: MediaQuery.of(context).isLarge,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Mdi.homeOutline),
                      selectedIcon: Icon(Mdi.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Mdi.trophyOutline),
                      selectedIcon: Icon(Mdi.trophy),
                      label: Text('Skills'),
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
                      icon: Icon(Mdi.certificateOutline),
                      selectedIcon: Icon(Mdi.certificate),
                      label: Text('Awards'),
                    ),
                  ],
                  selectedIndex: _index,
                  onDestinationSelected: (value) {
                    setState(() {
                      _index = value;
                    });
                  },
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
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
            )
          : body,
      bottomNavigationBar: MediaQuery.of(context).isSmall
          ? BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Mdi.homeOutline),
                  label: 'Home',
                  activeIcon: Icon(Mdi.home),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Mdi.trophyOutline),
                  label: 'Skills',
                  activeIcon: Icon(Mdi.trophy),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Mdi.briefcaseOutline),
                  label: 'Experience',
                  activeIcon: Icon(Mdi.briefcase),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Mdi.schoolOutline),
                  label: 'Education',
                  activeIcon: Icon(Mdi.school),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Mdi.heartOutline),
                  label: 'Volunteering',
                  activeIcon: Icon(Mdi.heart),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Mdi.certificateOutline),
                  label: 'Awards',
                  activeIcon: Icon(Mdi.certificate),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ],
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              currentIndex: _index,
            )
          : null,
    );
  }

  @override
  void initState() {
    super.initState();
    _index = 0;
  }
}
