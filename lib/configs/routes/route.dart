import 'package:go_router/go_router.dart';
import 'package:my_quran_id/features/quran/presentation/screens/surah_screen.dart';

import '../../features/quran/presentation/screens/quran_screen.dart';
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
    GoRoute(
      path: RouteLocation.quranScreen,
      name: RouteLocation.quranScreen,
      builder: (context, state) => const QuranScreen(),
    ),
    GoRoute(
      path: RouteLocation.surahScreen,
      name: RouteLocation.surahScreen,
      builder: (context, state) => const SurahScreen(),
    ),
  ],
);
