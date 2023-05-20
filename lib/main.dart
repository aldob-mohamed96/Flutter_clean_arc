


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/di/di.dart';
import 'package:project/core/extension/extension.dart';
import 'package:project/features/business_logic/cubit/theme/theme_cubit.dart';

import 'features/business_logic/cubit/authentication/authentication_cubit.dart';
import 'features/presentation/routes/pages.dart';
import 'features/presentation/widgets/localeWidget.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await initAppServicesGetIt();
  await EasyLocalization.ensureInitialized();

  runApp(const LocalizationWidget(child: AppMaterial()),
  );
}


class AppMaterial extends StatelessWidget {

  const AppMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => instance<AuthenticationCubit>()..getAppAuthenticationLevel()),
        BlocProvider(create: (_) => instance<ThemeCubit>()..getAppTheme()),

      ],
      child: const AppMaterials(),
    );
  }
}

class AppMaterials extends StatefulWidget {
  const AppMaterials({
    Key? key,
  }) : super(key: key);

  @override
  State<AppMaterials> createState() => _AppMaterialsState();
}

class _AppMaterialsState extends State<AppMaterials> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    final isLightTheme = SchedulerBinding.instance.window.platformBrightness ==
        Brightness.light;
    context.read<ThemeCubit>().updateAppTheme(
        isLightTheme ? ThemeMode.light : ThemeMode.dark);
    super.didChangePlatformBrightness();
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) =>state.changeAuthenticationStateExtension(context),
      builder: (context, state) {
        return MaterialApp.router(
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          backButtonDispatcher:AppRouter.router.backButtonDispatcher ,
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          themeMode:context.getAppTheme,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme: context.getLightTheme,
          darkTheme: context.getDarkTheme,


        );
      },
    );
  }

}

