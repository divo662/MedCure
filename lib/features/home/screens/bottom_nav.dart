import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medcure/constants/color_constants.dart';
import '../../search/screens/search_screens.dart';
import '../../settings/screens/setting_screen.dart';
import 'dashboard_screen.dart';
class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key,}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int pageIndex = 0;
  final List<Widget> pages = [
    const DashboardScreen(),
    const SearchScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[pageIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 30),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: darkPurple,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
            child: GNav(
              color: Colors.white,
              tabMargin: const EdgeInsets.all(3),
              gap: 4,
              onTabChange: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              selectedIndex: pageIndex,
              activeColor: primaryAppColor,
              iconSize: 40,
              padding: const EdgeInsets.all(13),
              tabs: const [
                GButton(
                  icon: Icons.dashboard,
                  text: "Dashboard",
                ),
                GButton(
                  icon: Icons.search,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Account",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
