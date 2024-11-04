import 'package:go_router/go_router.dart';

abstract class GoRouterApp {
  static bool isChecked = false;

  static final GoRouter router = GoRouter(
    routes: [],
    redirect: (context, state) {
      return null;
    },
  );
}
