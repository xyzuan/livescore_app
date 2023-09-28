import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:livescore/routes/pages_names.dart';
import 'package:livescore/screen/auth/auth_binding.dart';
import 'package:livescore/screen/auth/auth_screen.dart';
import 'package:livescore/screen/home/explore/explore_binding.dart';
import 'package:livescore/screen/home/explore/explore_screen.dart';
import 'package:livescore/screen/home/home_binding.dart';
import 'package:livescore/screen/home/home_screen.dart';
import 'package:livescore/screen/home/profile/profile_binding.dart';
import 'package:livescore/screen/home/profile/profile_screen.dart';
import 'package:livescore/screen/home/standings/standings_binding.dart';
import 'package:livescore/screen/home/standings/standings_screen.dart';
import 'package:livescore/screen/splash/splash_binding.dart';
import 'package:livescore/screen/splash/splash_screen.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.explore,
      page: () => ExplorePage(),
      binding: ExploreBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.standings,
      page: () => StandingsPage(),
      binding: StandingsBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
