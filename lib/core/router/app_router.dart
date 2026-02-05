import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String loginSignupWrapper = '/loginSignupWrapper';
  static const String home = '/home';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
          path: AppRoutes.splash,
          //pageBuilder: (context, state) => const CupertinoPage(child: SplashScreen())
      ),
    ],
  );
}
