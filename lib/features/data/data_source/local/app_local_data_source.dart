
import 'package:flutter/material.dart';

import '../../../../core/resources/export_file.dart';
import '../../request/requests.dart';


abstract class LocalDataSource{
 
Future<bool> logout() ;
Future<AppAuthenticationLevel> getLevelAuthenticationApp();
Future<bool> setLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest);
Future<ThemeMode> getThemeAppPreferences();
Future<bool> setThemeAppPreferences(ThemeModeAppReuest themeModeAppReuest);

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
  Future<bool> setLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest) async=>_appPreferences.setAppAuthenticationLevel(appAuthenticationLevelRequest.appAuthenticationLevel);
  
  //theme 
  @override
  Future<ThemeMode> getThemeAppPreferences() async=>_appPreferences.getThemeAppPreferences();
  
  @override
  Future<bool> setThemeAppPreferences(ThemeModeAppReuest themeModeAppReuest)  async=>_appPreferences.setThemeAppPreferences(themeModeAppReuest.themeMode);
  

}