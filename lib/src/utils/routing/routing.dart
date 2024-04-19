import 'package:go_router/go_router.dart';
import 'package:second_memory/src/features/archive/presentation/archive_screen.dart';
import 'package:second_memory/src/features/detail_view/presentation/detail_screen.dart';

import '../../features/adding/presentation/adding_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import 'error_page.dart';

enum AppRoute {
  home,
  adding,
  archive,
  detail,
}

final routeByName = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'detail/:title',
          name: AppRoute.detail.name,
          builder: (context, state) {
            final title = state.pathParameters['title']!;
            return DetailScreen(
              noteTitle: title,
            );
          },
        ),
        GoRoute(
          path: 'adding',
          name: AppRoute.adding.name,
          builder: (context, state) => AddingScreen(),
        ),
        GoRoute(
            path: 'archive',
            name: AppRoute.archive.name,
            builder: (context, state) => const ArchiveScreen()),
      ],
    ),
  ],
);
