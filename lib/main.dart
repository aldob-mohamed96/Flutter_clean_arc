
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/service/localization/app_localizations_setup.dart';
import 'features/business_logic/cubit/localization/localization_cubit.dart';

import 'core/di/di.dart';
import 'core/extension/extension.dart';
import 'features/business_logic/cubit/authentication/authentication_cubit.dart';
import 'features/business_logic/cubit/theme/theme_cubit.dart';
import 'features/presentation/routes/pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppServicesGetIt();

  runApp(
    const AppMaterial(),
  );
}

class AppMaterial extends StatelessWidget {
  const AppMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => instance<AuthenticationCubit>()),
        BlocProvider(create: (_) => instance<ThemeCubit>()),
        BlocProvider(create: (_) => instance<LocalizationCubit>()),
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

class _AppMaterialsState extends State<AppMaterials>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppThemeFromBrightness();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp.router(
          routeInformationProvider:instance<AppRouter>().router.routeInformationProvider,
          routeInformationParser:instance<AppRouter>().router.routeInformationParser,
          routerDelegate: instance<AppRouter>().router.routerDelegate,
          backButtonDispatcher:instance<AppRouter>().router.backButtonDispatcher,
          debugShowCheckedModeBanner: false,
          themeMode: context.themeMode,
          locale: instance<LocalizationCubit>().state.locale,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallBack,
          theme: context.lightTheme,
          darkTheme: context.darkTheme,
        );
      },
    );
  }
}
