import 'package:daily_003_flutter/theme/colors.dart';
import 'package:daily_003_flutter/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daily_003_flutter/screens/dashboard/dashboard_screen.dart';

class ScreenOption {
  const ScreenOption(this.title, this.icon, this.screen);
  final String title;
  final String icon;
  final Widget screen;
}

final List<ScreenOption> screens = [
  const ScreenOption("Home", "tab_home.svg", DashboardScreen()),
  const ScreenOption("Discover", "tab_discover.svg", DashboardScreen()),
  const ScreenOption("Insight", "tab_insight.svg", DashboardScreen()),
  const ScreenOption("Profile", "tab_profile.svg", DashboardScreen()),
];

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions =
      screens.map((e) => e.screen).toList();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: urbanistTextBodyXSStyle,
        selectedItemColor: primaryColor,
        unselectedLabelStyle: urbanistTextBodyXSStyle,
        items: <BottomNavigationBarItem>[
          for (var item in screens)
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("assets/icons/${item.icon}",
                  colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn)),
              icon: SvgPicture.asset("assets/icons/${item.icon}"),
              label: item.title,
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
