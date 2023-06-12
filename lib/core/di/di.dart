
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/data/network/api/app_api.dart';
import '../../features/data/network/network_factory/dio_factory.dart';
import '../../features/domain/usecases/chage_token_usecase.dart';
import '../../features/domain/usecases/change_authentication_usecase.dart';
import '../../features/domain/usecases/change_theme_usecase.dart';
import '../../features/domain/usecases/get_authentication_usecase.dart';
import '../../features/domain/usecases/get_theme_usecase.dart';
import '../../features/domain/usecases/get_token_usecase.dart';
import '../../features/domain/usecases/logout_usecase.dart';
import '../resources/export_file.dart';

final instance = GetIt.instance;
Future<void> initAppServicesGetIt() async {






  //-------------------------External---------------------------------
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => sharedPreferences);
  instance.registerLazySingleton<AppPreferences>(() => AppPreferencesImpl(sharedPreferences: instance()));
  


  //networking
  instance.registerLazySingleton(() => InternetConnectionChecker());
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(instance()));


  //api client

  instance.registerLazySingleton<DioFactory>(() => DioFactoryImpl(appPreferences: instance()));
  Dio dio = await instance<DioFactory>().getDio();


  //------------------------permission-------------------------


  instance.registerLazySingleton<PermissionHandling>(() => PermissionHandlingImpl());

  //-------------------------Api AppService Api Client---------------------------------
  instance.registerLazySingleton<AppServiceApiClient>(() => AppServiceApiClient(dio));


 
 
  //-------------------------DataSources---------------------------------

  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(appServiceApiClient: instance()));
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(appPreferences: instance()));


  //-------------------------Repository---------------------------------
  instance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(localDataSource: instance(),networkInfo: instance(),remoteDataSource: instance()));
  
  //-------------------------initial UseCase---------------------------------
  instance.registerLazySingleton<GetTokenUseCase>(() => GetTokenUseCase(repository:instance()));
  instance.registerLazySingleton<GetAuthenticationUseCase>(() => GetAuthenticationUseCase(repository:instance()));
  instance.registerLazySingleton<ChangeAuthenticationUseCase>(() => ChangeAuthenticationUseCase(repository:instance()));
  instance.registerLazySingleton<ChangeTokenUseCase>(() => ChangeTokenUseCase(repository:instance()));
  instance.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(repository:instance()));
  //---------------------theme usecase
  instance.registerLazySingleton<GetThemeAppUseCase>(() => GetThemeAppUseCase(repository:instance()));
  instance.registerLazySingleton<ChangeThemeAppUseCase>(() => ChangeThemeAppUseCase(repository:instance()));
  instance.registerLazySingleton<ThemeManager>(() => ThemeManagerImpl());
   
  


  //-------------------------cubit initial app---------------------------------
  instance.registerLazySingleton<AuthenticationCubit>(() => AuthenticationCubit(
                                              logoutUseCase: instance(),
                                              getTokenUseCase: instance(),
                                              getAuthenticationUseCase: instance(),
                                              changeAuthenticationUseCase: instance(),
                                              changeTokenUseCase: instance()
                                              )..getAppAuthenticationLevel());



   instance.registerLazySingleton<AppRouter>(() => AppRouterImpl(authenticationCubit: instance()));

   instance.registerLazySingleton<ThemeCubit>(() => ThemeCubit(
                                              changeThemeAppUseCase: instance(),
                                              getThemeAppUseCase: instance(),
                                              themeManager: instance())..getAppTheme());

}