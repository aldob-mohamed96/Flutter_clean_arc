
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/features/presentation/screens/auth/login.dart';
import 'package:project/features/presentation/screens/profile/profile.dart';

import '../../../core/resources/export_file.dart';
import '../screens/home/home_screen.dart';

 abstract interface class AppRouter{
  GoRouter get router;
 }
 class AppRouterImpl implements AppRouter {
   final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  final AuthenticationCubit _authenticationCubit;
  
  AppRouterImpl({required AuthenticationCubit authenticationCubit }):_authenticationCubit=authenticationCubit;


 

    @override
    GoRouter get router => GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    errorBuilder: _errorWidget,
    errorPageBuilder: _errorPageWidget,
    initialLocation: Routes.splashRoute ,
    routes: <GoRoute>[

      GoRoute(path: Routes.splashRoute, builder:_splashRouteBuilder,),
      GoRoute(path: Routes.onBoardingRoute, builder:_onBoardingRouteBuilder,),
      GoRoute(path: Routes.homeRoute, builder:_homeRouteBuilder,),
      GoRoute(path: Routes.loginRoute, builder:_loginRouteBuilder,),
      GoRoute(path: Routes.profileRoute, builder:_profileRouteBuilder,),

    ],
    redirect: redirctionPage,
    refreshListenable: GoRouterRefreshStream(_authenticationCubit.stream)
  );



  



   String redirctionPage(BuildContext context, GoRouterState state)=>_authenticationCubit.state.appAuthenticationLevel.getRoutesStatus();
   Widget _onBoardingRouteBuilder(BuildContext context, GoRouterState state) => const OnBoardingScreen();
   Widget _splashRouteBuilder(BuildContext context, GoRouterState state) => const SplashScreen();
   Widget _errorWidget(BuildContext context, GoRouterState state) => const UndefinedRouteScreen();
   Widget _homeRouteBuilder(BuildContext context, GoRouterState state) => const HomeScreen();
   Widget _loginRouteBuilder(BuildContext context, GoRouterState state) => const LoginScreen();
   Widget _profileRouteBuilder(BuildContext context, GoRouterState state) => const ProfileScreen();
   
   MaterialPage _errorPageWidget(BuildContext context, GoRouterState state) => const MaterialPage(child: UndefinedRouteScreen());
  

 

}


class GoRouterRefreshStream extends ChangeNotifier{

  late final StreamSubscription<dynamic> _subscription;
  GoRouterRefreshStream(Stream<dynamic> stream)
  {
    notifyListeners();
    _subscription=stream.asBroadcastStream()
    .listen((dynamic _)=>notifyListeners);

  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

}

