import 'package:go_router/go_router.dart';
import 'package:pulse_post/app/presentation/modules/auth/pages/home_page.dart';
import 'package:pulse_post/app/presentation/modules/auth/pages/login_page.dart';
import 'package:pulse_post/app/presentation/modules/auth/pages/splash_page.dart';
import 'package:pulse_post/app/utils/navigator/navigator_global.dart';

sealed class AppRoutes {
  static final GoRouter route = GoRouter(
    navigatorKey: NavigatorGlobal.navigatorKey,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    ],
  );
}
