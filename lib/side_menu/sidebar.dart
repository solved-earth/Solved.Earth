import 'package:app/pages/achievement_page.dart';
import 'package:app/pages/challenge_list_page.dart';
import 'package:app/pages/main_page.dart';
import 'package:app/pages/tree_design_page.dart';
import 'package:app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class SideBar extends StatefulWidget {
  static String routename = "/";
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<ScreenHiddenDrawer> _pages = [];

  final _baseStyle = const TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  final _selectedStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    _pages = [
      //main page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Hello there!',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const MainPage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Select your tree!',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const TreeDesignPage(),
      ),

      //achievement page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Achievement',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const AchievementPage(),
      ),

      //challenge list page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Challnge',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const ChallngeListPage(),
      ),

      //setting page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Settings',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const SettingsPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: const Color.fromRGBO(151, 193, 169, 1),
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
    );
  }
}
