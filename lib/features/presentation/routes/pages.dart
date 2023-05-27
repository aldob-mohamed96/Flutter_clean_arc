
import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';
//test jjjj
 sealed class AppRouter {

  static GoRouter get router => _router;

  static Widget _onBoardingRouteBuilder(BuildContext context, GoRouterState state) => const OnBoardingScreen();
  static Widget _splashRouteBuilder(BuildContext context, GoRouterState state) => const SplashScreen();
  static Widget _errorWidget(BuildContext context, GoRouterState state) => const UndefinedRouteScreen();
  static MaterialPage _errorPageWidget(BuildContext context, GoRouterState state) => const MaterialPage(child: UndefinedRouteScreen());

  static final GoRouter _router = GoRouter(
    errorBuilder: _errorWidget,
    errorPageBuilder: _errorPageWidget,


    routes: <RouteBase>[
      GoRoute(
        path: Routes.splashRoute,
        builder:_splashRouteBuilder,
        routes: <RouteBase>[

          GoRoute(path: Routes.onBoardingRoute, builder: _onBoardingRouteBuilder),
        ],
      ),
    ],
  );




  final BackButtonDispatcher childDispatcher = _router.backButtonDispatcher.createChildBackButtonDispatcher();


 

}

