import 'package:go_router/go_router.dart';
import 'package:app/side_menu/sidebar.dart';
import 'package:app/pages/main_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SideBar.routename,
      builder: (context, state) => const SideBar(),
    ),
    GoRoute(
      path: "/mainpage",
      builder: (context, state) => const MainPage(),
    ),
  ],
);
