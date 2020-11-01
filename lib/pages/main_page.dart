import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:thomas_clark/extensions/media_query_data_extensions.dart';
import 'package:thomas_clark/pages/achievements_page.dart';
import 'package:thomas_clark/pages/education_page.dart';
import 'package:thomas_clark/pages/experience_page.dart';
import 'package:thomas_clark/pages/home_page.dart';
import 'package:thomas_clark/pages/volunteering_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? _index;

  @override
  Widget build(BuildContext context) {
    final body = IndexedStack(
      index: _index,
      children: [
        const HomePage(),
        const ExperiencePage(),
        const EducationPage(),
        const VolunteeringPage(),
        const AchievementsPage(),
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
                  selectedIndex: _index!,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Mdi.email),
        tooltip: 'Email',
        onPressed: () async {
          if (await canLaunch('mailto:tnc1997@virginmedia.com')) {
            await launch('mailto:tnc1997@virginmedia.com');
          }
        },
      ),
      bottomNavigationBar: MediaQuery.of(context).isSmall
          ? Builder(
              builder: (context) {
                final colorScheme = Theme.of(context)?.colorScheme;
                final isDark = colorScheme?.brightness == Brightness.dark;
                final backgroundColor =
                    isDark ? colorScheme?.surface : colorScheme?.primary;
                final itemColor =
                    isDark ? colorScheme?.onSurface : colorScheme?.onPrimary;

                return BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Mdi.homeOutline),
                      label: 'Home',
                      activeIcon: Icon(Mdi.home),
                      backgroundColor: backgroundColor,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Mdi.briefcaseOutline),
                      label: 'Experience',
                      activeIcon: Icon(Mdi.briefcase),
                      backgroundColor: backgroundColor,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Mdi.schoolOutline),
                      label: 'Education',
                      activeIcon: Icon(Mdi.school),
                      backgroundColor: backgroundColor,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Mdi.heartOutline),
                      label: 'Volunteering',
                      activeIcon: Icon(Mdi.heart),
                      backgroundColor: backgroundColor,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Mdi.trophyOutline),
                      label: 'Achievements',
                      activeIcon: Icon(Mdi.trophy),
                      backgroundColor: backgroundColor,
                    ),
                  ],
                  onTap: (value) {
                    setState(() {
                      _index = value;
                    });
                  },
                  currentIndex: _index!,
                  selectedItemColor: itemColor,
                  unselectedItemColor: itemColor,
                );
              },
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
