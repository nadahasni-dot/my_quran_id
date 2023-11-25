import 'package:go_router/go_router.dart';

import '../../features/splash/splash.dart';
import '../../features/home/home.dart';
import 'route_location.dart';

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: RouteLocation.splashScreen,
      name: RouteLocation.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteLocation.homeScreen,
      name: RouteLocation.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
