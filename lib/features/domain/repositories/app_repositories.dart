import 'package:flutter/material.dart';

import '../../../../core/resources/export_file.dart';
import '../../data/request/requests.dart';
import '../entity/logout.dart';
abstract class AppRepository {


  Future<Either<Failure,Logout>> logout();
  Future<Either<Failure,AppAuthenticationLevel>> getLevelAuthenticationApp();
  Future<Either<Failure,Unit>> setLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest);
 
  Future<Either<Failure,ThemeMode>> getThemeAppPreferences();
  Future<Either<Failure,Unit>> setThemeAppPreferences(ThemeModeAppReuest themeModeAppReuest);
  Future<Either<Failure,String>> getToken();
  Future<Either<Failure,Unit>>   setToken(TokenRequest tokenRequest);

 

}