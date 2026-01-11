import 'package:go_router/go_router.dart';
import 'package:pulse_post/app/presentation/modules/auth/pages/login_page.dart';
import 'package:pulse_post/app/presentation/modules/auth/pages/register_page.dart';
import 'package:pulse_post/app/presentation/modules/auth/pages/splash_page.dart';
import 'package:pulse_post/app/presentation/modules/feed/pages/feed_page.dart';
import 'package:pulse_post/app/presentation/modules/feed/pages/my_profile_page.dart';
import 'package:pulse_post/app/utils/navigator/navigator_global.dart';

sealed class AppRoutes {
  static final GoRouter route = GoRouter(
    navigatorKey: NavigatorGlobal.navigatorKey,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/register', builder: (context, state) => RegisterPage()),
      GoRoute(path: '/feed', builder: (context, state) => FeedPage()),
      GoRoute(path: '/my-profile', builder: (context, state) => MyProfilePage()),
    ],
  );
}
