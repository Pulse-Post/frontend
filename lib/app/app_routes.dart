import 'package:go_router/go_router.dart';
import 'package:pulse_post/app/utils/navigator/navigator_global.dart';

sealed class AppRoutes {
  static final GoRouter route = GoRouter(
    navigatorKey: NavigatorGlobal.navigatorKey,
    routes: [],
  );
}
