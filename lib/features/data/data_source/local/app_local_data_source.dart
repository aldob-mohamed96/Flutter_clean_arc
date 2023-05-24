
import 'package:flutter/material.dart';

import '../../../../core/resources/export_file.dart';


abstract class LocalDataSource{
 
Future<bool> logout() ;
Future<AppAuthenticationLevel> getLevelAuthenticationApp();
Future<bool> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel);
Future<ThemeMode> getThemeAppPreferences();
Future<bool> setThemeAppPreferences(ThemeMode themeMode);

}
class LocalDataSourceImpl extends LocalDataSource{
  final AppPreferences _appPreferences;
  LocalDataSourceImpl({required AppPreferences appPreferences }):_appPreferences=appPreferences;
  
  //auth
  @override
  Future<bool> logout() async=> await _appPreferences.logout();
  
  @override
  Future<AppAuthenticationLevel> getLevelAuthenticationApp() async=>_appPreferences.getAppAuthenticationLevel();
  
  @override
  Future<bool> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel) async=>_appPreferences.setAppAuthenticationLevel(appAuthenticationLevel);
  
  //theme 
  @override
  Future<ThemeMode> getThemeAppPreferences() async=>_appPreferences.getThemeAppPreferences();
  
  @override
  Future<bool> setThemeAppPreferences(ThemeMode themeMode)  async=>_appPreferences.setThemeAppPreferences(themeMode);
  

}