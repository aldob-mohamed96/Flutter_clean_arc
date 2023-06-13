
import 'package:project/features/domain/entity/data_value.dart';

import '../../../../core/resources/export_file.dart';
import '../../request/requests.dart';


abstract interface class  LocalDataSource{
 
Future<SuccessOperation>            logout() ;
Future<AppAuthenticationLevelData>  getLevelAuthenticationApp();
Future<SuccessOperation>            cashLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest);
Future<ThemeModeData>               getThemeApp();
Future<SuccessOperation>            cashThemeApp(ThemeModeAppReuest themeModeAppReuest);
Future<TokenData>                   getToken();
Future<SuccessOperation>            cashToken(TokenRequest tokenRequest);
Future<LocalAppData>                getLocalApp();
Future<SuccessOperation>            cashLocalApp(LocalAppRequest tokenRequest);



}
class LocalDataSourceImpl implements LocalDataSource{
  final AppPreferences _appPreferences;
  LocalDataSourceImpl({required AppPreferences appPreferences }):_appPreferences=appPreferences;
  
  //auth
  @override
  Future<SuccessOperation> logout() async=> await _appPreferences.logout();
  
  @override
  Future<AppAuthenticationLevelData> getLevelAuthenticationApp() async=>_appPreferences.getAppAuthenticationLevel();
  
  @override
  Future<SuccessOperation> cashLevelAuthenticationApp(AppAuthenticationLevelRequest appAuthenticationLevelRequest) async=>await _appPreferences.cashAppAuthenticationLevel(appAuthenticationLevelRequest.appAuthenticationLevel);
  
  //theme 
  @override
  Future<ThemeModeData> getThemeApp() async=> _appPreferences.getThemeApp();
  
  @override
  Future<SuccessOperation> cashThemeApp(ThemeModeAppReuest themeModeAppReuest)  async=>await _appPreferences.cashThemeApp(themeModeAppReuest.themeMode);
  
  @override
  Future<TokenData> getToken() async=>_appPreferences.getToken();
  
  @override
  Future<SuccessOperation> cashToken(TokenRequest tokenRequest)  async=>await _appPreferences.cashToken(tokenRequest.value);
  
  @override
  Future<SuccessOperation> cashLocalApp(LocalAppRequest localAppRequest) async=>await _appPreferences.cashLocalApp(localAppRequest.value.languageCode);
  
  @override
  Future<LocalAppData> getLocalApp() async=>_appPreferences.getLocalApp();
  

}