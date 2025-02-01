import 'package:go_router/go_router.dart';

import '../../main/factories/factories.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => TodoScreenFactory.createTodoPage()),
      // StatefulShellRoute.indexedStack(
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(path: '/', builder: (context, state) => TodoScreenFactory.createTodoPage()),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(path: '/create', builder: (context, state) => TodoScreenFactory.createTodoPage()),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(path: '/searchTask', builder: (context, state) => SearchScreen()),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(path: '/completedTasks', builder: (context, state) => CompletedTasksScreen()),
      //       ],
      //     ),
      //   ],
      //   builder: (context, state, navigationShell) => NavigationShell(navigationShell: navigationShell),
      // ),
    ],
  );
}
