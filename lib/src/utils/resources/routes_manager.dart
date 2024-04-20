// import 'package:flutter/material.dart';
// import 'package:leki_u_dzieci_2_0/presentation/home/home_view.dart';
// import 'package:leki_u_dzieci_2_0/presentation/resources/strings_manager.dart';
//
// import '../splash/splash_view.dart';
//
class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
}
//
// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(
//           builder: (_) => const SplashView(),
//         );
//       case Routes.homeRoute:
//         return MaterialPageRoute(
//           builder: (_) => const HomeView(),
//         );
//       default:
//         return unDefinedRoute();
//     }
//   }
//
//   static Route<dynamic> unDefinedRoute() => MaterialPageRoute(
//         builder: (_) => Scaffold(
//           appBar: AppBar(
//             title: const Text(AppStrings.onRouteFound),
//           ),
//           body: const Center(
//             child: Text(AppStrings.onRouteFound),
//           ),
//         ),
//       );
// }
