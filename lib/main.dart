import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/extension/extension.dart';
import 'features/business_logic/cubit/authentication/authentication_cubit.dart';
import 'features/business_logic/cubit/theme/theme_cubit.dart';
import 'features/presentation/routes/pages.dart';
import 'features/presentation/widgets/locale_widget.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await initAppServicesGetIt();

  runApp(const Localization(child: AppMaterial()),
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
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return MaterialApp.router(
            routeInformationProvider: instance<AppRouter>().router.routeInformationProvider,
            routeInformationParser: instance<AppRouter>().router.routeInformationParser,
            routerDelegate: instance<AppRouter>().router.routerDelegate,
            backButtonDispatcher:instance<AppRouter>().router.backButtonDispatcher ,
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

