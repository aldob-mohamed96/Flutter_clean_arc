import 'package:flutter/material.dart';

import '../../../../core/resources/export_file.dart';
abstract class AppRepository {


  Future<Either<Failure,bool>> logout();
  Future<Either<Failure,AppAuthenticationLevel>> getLevelAuthenticationApp();
  Future<Either<Failure,Unit>> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel);
 
  Future<Either<Failure,ThemeMode>> getThemeAppPreferences();
  Future<Either<Failure,Unit>> setThemeAppPreferences(ThemeMode themeMode);
 

}