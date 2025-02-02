import 'package:go_router/go_router.dart';

import '../../main/factories/factories.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => TodoScreenFactory.createTodoPage())],
  );
}
