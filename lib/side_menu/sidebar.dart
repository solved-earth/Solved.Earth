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

  // basic style of side bar text
  final _baseStyle = const TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  // selected style of side bar text
  final _selectedStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    _pages = [
      // main page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '안녕하세요!', // name of menu
          baseStyle: _baseStyle, // basic style of menu
          selectedStyle: _selectedStyle, // selected style of menu
        ),
        const MainPage(), // page to link
      ),

      // tree design page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '나무 변경하기',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const TreeDesignPage(),
      ),

      // achievement page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '달성한 업적',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const AchievementPage(),
      ),

      // challenge list page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '도전과제',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
        ),
        const ChallngeListPage(),
      ),

      // setting page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '설정',
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
      backgroundColorMenu: const Color.fromRGBO(
          151, 193, 169, 1), // background color of side bar menu
      screens: _pages,
      initPositionSelected: 0, //default selected page index is 0
      slidePercent: 60, // percentage of the sidebar displayed
    );
  }
}
