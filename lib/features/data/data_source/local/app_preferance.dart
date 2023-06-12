

import 'package:flutter/material.dart';
import 'package:project/features/domain/entity/data_value.dart';

import '../../../../core/resources/export_file.dart';



abstract interface class AppPreferences {

  //setting app local data

  Future<SuccessOperation> cashThemeApp(ThemeMode themeMode);
  Future<SuccessOperation> cashToken(String token);
  Future<SuccessOperation> cashAppAuthenticationLevel(AppAuthenticationLevel levelApp);
  Future<SuccessOperation> cashLocalApp(String codeLanguage);
  Future<SuccessOperation> logout();


  ThemeModeData getThemeApp();
  AppAuthenticationLevelData getAppAuthenticationLevel();
  TokenData getToken();
  LocalAppData getLocalApp();
  




}


class AppPreferencesImpl implements AppPreferences {

  final SharedPreferences _sharedPreferences;

  AppPreferencesImpl({required SharedPreferences sharedPreferences}):
    _sharedPreferences=sharedPreferences;



  @override
  AppAuthenticationLevelData getAppAuthenticationLevel() {
    return _sharedPreferences.getString(AppConstants.appAppAuthenticationLevelPrefsKey).getAppAuthenticationLevel();
  }

  @override
  ThemeModeData getThemeApp() {
    return _sharedPreferences.getString(AppConstants.appThemeModePrefsKey).getThemeModeApp();
  }





  @override
  Future<SuccessOperation> cashAppAuthenticationLevel(AppAuthenticationLevel level)async {
   return  await _sharedPreferences.setString(AppConstants.appAppAuthenticationLevelPrefsKey,level.name).booLDataReturnedValue();
  
    
  }

  @override
  Future<SuccessOperation> logout()async {
    _sharedPreferences.clear();
    return await _sharedPreferences.setString(AppConstants.appAppAuthenticationLevelPrefsKey,AppAuthenticationLevel.unAuthenticated.name).booLDataReturnedValue();
  }

  @override
  Future<SuccessOperation> cashThemeApp(ThemeMode themeMode) {
    return _sharedPreferences.setString(AppConstants.appThemeModePrefsKey,themeMode.name).booLDataReturnedValue();
  }
  
  @override
  TokenData getToken() =>_sharedPreferences.getString(AppConstants.appTokenUserPrefsKey).getTokenValue();
  
  @override
  Future<SuccessOperation> cashToken(String token) =>_sharedPreferences.setString(AppConstants.appTokenUserPrefsKey,token).booLDataReturnedValue();
  
  @override
  Future<SuccessOperation> cashLocalApp(String codeLanguage ) =>_sharedPreferences.setString(AppConstants.appLocalePrefsKey,codeLanguage).booLDataReturnedValue();
  
  @override
  LocalAppData getLocalApp()=> _sharedPreferences.getString(AppConstants.appLocalePrefsKey,).getLocalAppValue();
 

}
