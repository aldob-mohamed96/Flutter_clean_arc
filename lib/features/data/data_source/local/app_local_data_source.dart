
import 'package:project/features/domain/entity/data_value.dart';

import '../../../../core/resources/export_file.dart';
import '../../request/requests.dart';


abstract interface class  LocalDataSource{
 
Future<SuccessOperation> logout() ;
Future<AppAuthenticationLevel> getLevelAuthenticationApp();
Future<SuccessOperation> setLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest);
Future<ThemeModeData> getThemeAppPreferences();
Future<SuccessOperation> setThemeAppPreferences(ThemeModeAppReuest themeModeAppReuest);
Future<SuccessOperation>   setToken(TokenRequest tokenRequest);
Future<TokenData> getToken();


}
class LocalDataSourceImpl implements LocalDataSource{
  final AppPreferences _appPreferences;
  LocalDataSourceImpl({required AppPreferences appPreferences }):_appPreferences=appPreferences;
  
  //auth
  @override
  Future<SuccessOperation> logout() async=> await _appPreferences.logout();
  
  @override
  Future<AppAuthenticationLevel> getLevelAuthenticationApp() async=>_appPreferences.getAppAuthenticationLevel();
  
  @override
  Future<SuccessOperation> setLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest) async=>await _appPreferences.setAppAuthenticationLevel(appAuthenticationLevelRequest.appAuthenticationLevel);
  
  //theme 
  @override
  Future<ThemeModeData> getThemeAppPreferences() async=> _appPreferences.getThemeAppPreferences();
  
  @override
  Future<SuccessOperation> setThemeAppPreferences(ThemeModeAppReuest themeModeAppReuest)  async=>await _appPreferences.setThemeAppPreferences(themeModeAppReuest.themeMode);
  
  @override
  Future<TokenData> getToken() async=>_appPreferences.getToken();
  
  @override
  Future<SuccessOperation> setToken(TokenRequest tokenRequest)  async=>await _appPreferences.setToken(tokenRequest.value);
  

}