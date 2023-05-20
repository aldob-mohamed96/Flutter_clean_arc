// ignore_for_file: constant_identifier_names


import '../../features/data/data_source/local/preferance.dart';
import '../enum/enums.dart';



abstract class AuthenticationManager
{
  AppAuthenticationLevel getLevelAuthenticationApp();

  Future<void> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel);
  Future<void> logout();

}
class AuthenticationManagerImpl extends AuthenticationManager {

  final AppSettingPreferences _appSettingPreferences;

  AuthenticationManagerImpl(this._appSettingPreferences);


  @override
  AppAuthenticationLevel getLevelAuthenticationApp()=>_appSettingPreferences.getAppAuthenticationLevel();

  @override
  Future<void> setLevelAuthenticationApp(AppAuthenticationLevel appAuthenticationLevel) async=> await _appSettingPreferences.setAppAuthenticationLevel(appAuthenticationLevel);
 
  @override
  Future<void> logout() async=> await _appSettingPreferences.logout();




}