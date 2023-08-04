import 'package:app/side_menu/sidebar.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SideBar.routename,
      builder: (context, state) => const SideBar(),
    ),
  ],
);
