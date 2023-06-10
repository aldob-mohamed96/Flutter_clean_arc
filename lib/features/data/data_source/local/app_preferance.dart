

import 'package:flutter/material.dart';
import 'package:project/features/domain/entity/data_value.dart';

import '../../../../core/resources/export_file.dart';



abstract interface class AppPreferences {

  //setting app local data

  Future<SuccessOperation> setThemeAppPreferences(ThemeMode themeMode);
  Future<SuccessOperation> setToken(String token);
  Future<SuccessOperation> setAppAuthenticationLevel(AppAuthenticationLevel levelApp);
  Future<SuccessOperation> logout();


  ThemeModeData getThemeAppPreferences();
  AppAuthenticationLevel getAppAuthenticationLevel();
  TokenData getToken();
  




}


final class AppPreferencesImpl implements AppPreferences {

  final SharedPreferences _sharedPreferences;

  AppPreferencesImpl({required SharedPreferences sharedPreferences}):
    _sharedPreferences=sharedPreferences;



  @override
  AppAuthenticationLevel getAppAuthenticationLevel() {
    return _sharedPreferences.getString(AppConstants.appAppAuthenticationLevelPrefsKey).getAppAuthenticationLevel();
  }

  @override
  ThemeModeData getThemeAppPreferences() {
    return _sharedPreferences.getString(AppConstants.appThemeModePrefsKey).getThemeModeApp();
  }





  @override
  Future<SuccessOperation> setAppAuthenticationLevel(AppAuthenticationLevel level)async {
   return  await _sharedPreferences.setString(AppConstants.appAppAuthenticationLevelPrefsKey,level.name).booLDataReturnedValue();
  
    
  }

  @override
  Future<SuccessOperation> logout()async {
    _sharedPreferences.clear();
    return await _sharedPreferences.setString(AppConstants.appAppAuthenticationLevelPrefsKey,AppAuthenticationLevel.unAuthenticated.name).booLDataReturnedValue();
  }

  @override
  Future<SuccessOperation> setThemeAppPreferences(ThemeMode themeMode) {
    return _sharedPreferences.setString(AppConstants.appThemeModePrefsKey,themeMode.name).booLDataReturnedValue();
  }
  
  @override
  TokenData getToken() =>_sharedPreferences.getString(AppConstants.appTokenUserPrefsKey).getTokenValue();
  
  @override
  Future<SuccessOperation> setToken(String token) =>_sharedPreferences.setString(AppConstants.appTokenUserPrefsKey,token).booLDataReturnedValue();




}
