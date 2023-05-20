

import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';



abstract class AppSettingPreferences {

  //setting app local data

  Future<bool> setThemeAppPreferences(ThemeMode themeMode);
  Future<bool> setAppAuthenticationLevel(AppAuthenticationLevel levelApp);
  Future<bool> logout();


  ThemeMode getThemeAppPreferences();
  AppAuthenticationLevel getAppAuthenticationLevel();




}


class AppSettingPreferencesImpl implements AppSettingPreferences {

  final SharedPreferences _sharedPreferences;

  AppSettingPreferencesImpl({required SharedPreferences sharedPreferences}):
    _sharedPreferences=sharedPreferences;





  @override
  AppAuthenticationLevel getAppAuthenticationLevel() {
    return _sharedPreferences.getString(AppConstants.appAppAuthenticationLevelPrefsKey).getAppAuthenticationLevel();
  }

  @override
  ThemeMode getThemeAppPreferences() {
    return _sharedPreferences.getString(AppConstants.appThemeModePrefsKey).getThemeModeApp();
  }





  @override
  Future<bool> setAppAuthenticationLevel(AppAuthenticationLevel level)async {
    return  await _sharedPreferences.setString(AppConstants.appAppAuthenticationLevelPrefsKey,level.name);
  }

  @override
  Future<bool> logout()async {
    return  await _sharedPreferences.setString(AppConstants.appAppAuthenticationLevelPrefsKey,AppAuthenticationLevel.unAuthenticated.name);
  }

  @override
  Future<bool> setThemeAppPreferences(ThemeMode themeMode) {
    return _sharedPreferences.setString(AppConstants.appThemeModePrefsKey,themeMode.name);
  }




}